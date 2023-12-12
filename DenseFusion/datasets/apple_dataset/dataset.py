import torch.utils.data as data
import json
import matplotlib.pyplot as plt
from PIL import Image, ImageFile
ImageFile.LOAD_TRUNCATED_IMAGES = True
import cv2
from mpl_toolkits.mplot3d import Axes3D
import os
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"
import cv2
import os.path
import glob
import torch
import numpy as np
import torchvision.transforms as transforms
from scipy.spatial.transform import Rotation
import argparse
import time
import random
from lib.transformations import quaternion_from_euler, euler_matrix, random_quaternion, quaternion_matrix
import numpy.ma as ma
import copy
import scipy.misc
import scipy.io as scio

def get_imgs_paths(root_path):
    image_list=[]
    directories=[x for x in os.listdir(root_path) if os.path.isdir(root_path)]
    for dir in directories:
        full_path=os.path.join(root_path,dir)
        image_list.extend(glob.glob(os.path.join(full_path,'*.png')))

    return image_list

def depth_image_from_distance_image(distance, fx,fy,cx,cy):
  """Computes depth image from distance image.
  
  Background pixels have depth of 0
  
  Args:
      distance: HxW float array (meters)
      intrinsics: 3x3 float array
  
  Returns:
      z: HxW float array (meters)
  
  """
  
  height, width = distance.shape
  xlin = np.linspace(0, width - 1, width)
  ylin = np.linspace(0, height - 1, height)
  px, py = np.meshgrid(xlin, ylin)
  
  x_over_z = (px - cx) / fx
  y_over_z = (py - cy) / fy
  
  
  z = distance / np.sqrt(1. + x_over_z**2 + y_over_z**2)
  return z
    

class PoseDataset(data.Dataset):
    def __init__(self, mode, num_pt, add_noise, root, noise_trans, refine):
        self.root = root
        
        self.image_list = []
        self.objects_classes=[]
        self.cam_scale = 1
        self.cam_cutoff = 3

        if mode == 'train':
            #path contains root path for images and point cloud 
            #read train images path from train.json used for yolact 
            self.path = os.path.join(self.root,'dataset_apple_7')
        elif mode == 'test':
             #read train images path from test.json used for yolact 
            self.path = os.path.join(self.root,'dataset_apple_7')

        self.mode=mode
        self.image_list=get_imgs_paths(self.path)
        self.num_pt = num_pt
        self.add_noise = add_noise
        self.noise_trans = noise_trans
        self.length = len(self.image_list)
        
        #contains the base path for configuration inside DenseFusion 
        configuration_base_path="datasets/apple_dataset/dataset_config"
      
        #since we use the same ycb classes use the same .txt file
        class_file = open(os.path.join(configuration_base_path,'classes.txt'))
        class_id = 1
        self.cld = {}
        self.class_dict = {}
        while 1:
            class_input = class_file.readline().replace('\n',"")
            #add the read classes in the vector of the classes of interest
            self.objects_classes.append(class_input)
            if not class_input:
                break
            #complete point cloud of each object
            #input_file = open('{0}/YCB_Video_Models/models/{1}/points.xyz'.format(self.root, class_input))
            input_file=open(os.path.join(self.root,"apple_dataset_revisited","apple.xyz"))
            self.class_dict[class_input]=class_id
            self.cld[class_id] = []
            #store point cloud in order
            while 1:
                input_line = input_file.readline()
                if not input_line:
                    break
                input_line = input_line[:-1].split(' ')
                temp=np.array([float(input_line[0]), float(input_line[1]), float(input_line[2])])
                self.cld[class_id].append(list(temp))
            self.cld[class_id] = np.array(self.cld[class_id])
            input_file.close()
            
            class_id += 1
            """
            fig1= plt.figure()
            ax1 = fig1.add_subplot(projection='3d')
            img_plt = ax1.scatter(self.cld[1][:,0], self.cld[1][:,1], self.cld[1][:,2])

            ax1.set_xlabel('X')
            ax1.set_ylabel('Y')
            ax1.set_zlabel('Z')

            plt.show()
            """
                  
        #get the camera instrisc from the file generated by nvisii
        
        camera_json_ptr = open(os.path.join(configuration_base_path,"camera_intrisics.json"))
        camera_json = json.load(camera_json_ptr)
        camera_intrisic = camera_json['camera_params']
        self.cam_cx_1 = camera_intrisic['cx']
        self.cam_cy_1 = camera_intrisic['cy']
        self.cam_fx_1 = camera_intrisic['fx']
        self.cam_fy_1 = camera_intrisic['fy']
        self.width=camera_intrisic['width']
        self.height=camera_intrisic['height']
        camera_json_ptr.close()
    
        self.xmap = np.array([[j for i in range(self.width)] for j in range(self.height)])
        self.ymap = np.array([[i for i in range(self.width)] for j in range(self.height)])
        
        self.trancolor = transforms.ColorJitter(0.2, 0.2, 0.2, 0.05)
        self.noise_img_loc = 0.0
        self.noise_img_scale = 7.0
        self.minimum_num_pt = 2500
        self.norm = transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
        self.symmetry_obj_idx = []
        self.num_pt_mesh_small = 500
        self.num_pt_mesh_large = 500
        self.refine = refine


    def __getitem__(self, index):
        #self.image_list contains thee urls of the rgb images, so in order to
        #obtain the depth and the segmentation simply change the estension
        img = Image.open(self.image_list[index])
        #img.show()
        depth_path = self.image_list[index].replace('png','depth.exr')
        depth = cv2.imread(depth_path,cv2.IMREAD_UNCHANGED)[:,:,0]
        #cv2.imshow("test",depth)
        #cv2.waitKey(0)
        #since nvisii sets the background to -3*10e8 change that to 0
        depth[depth<0]=0
        #convert distance image into real depth
        depth=depth_image_from_distance_image(depth,self.cam_fx_1,self.cam_fy_1,self.cam_cx_1,self.cam_cy_1)
        #make background also the points too far from the camera so they are excluded
        #this is necessary in particolar when we process background images where we have a rendered object (the background plane)
        #located very far from the camera but still captured by the depth  
        #depth[depth>self.cam_cutoff]=0
        seg_path = self.image_list[index].replace('png','seg.exr')
        
        
        try:
            label = cv2.imread(seg_path,cv2.IMREAD_UNCHANGED)[:,:,0]
        except:
            print(seg_path)

        

        ann_path=self.image_list[index].replace('png','json')
        meta = json.load(open(ann_path))
        cam_cx = self.cam_cx_1
        cam_cy = self.cam_cy_1
        cam_fx = self.cam_fx_1
        cam_fy = self.cam_fy_1

        if self.add_noise:
            img = self.trancolor(img)
            img=np.asanyarray(img)
    
        cloud_list=[]
        choose_list=[]
        img_list=[]
        target_list=[]
        model_points_list=[]
        class_id_list=[]
        mask_depth = (depth != 0)

        for i,object in enumerate(meta['objects']):
            #if the annotation belongs to an object in the classes of interest
            if object['class'] in self.objects_classes:
                seg_id=object['segmentation_id']
                mask_label = (label == seg_id)
                mask = mask_label * mask_depth

                if len(mask.nonzero()[0]) > self.minimum_num_pt:
                    selected_obj_class=meta['objects'][i]['class']
                    cld_id=self.class_dict[selected_obj_class]
                    rmin, rmax, cmin, cmax=get_bbox(mask_label)
                    img_obj = np.transpose(np.array(img)[:, :, :3], (2, 0, 1))[:, rmin:rmax, cmin:cmax]
                    #orientation of the object frame in camera frame (xyzw format)
                    target_r = np.array(meta['objects'][i]['quaternion_xyzw'])
                    target_r= Rotation.from_quat(target_r).as_matrix()
                    #position of the object frame in camera frame
                    target_t = np.array(meta['objects'][i]['location'])
                    add_t = np.array([random.uniform(-self.noise_trans, self.noise_trans) for i in range(3)])
                    choose = mask[rmin:rmax, cmin:cmax].flatten().nonzero()[0]
                    """
                    plt.subplot(1, 3, 2)
                    plt.imshow(mask_label[rmin:rmax, cmin:cmax],cmap='gray')
                    plt.axis('off')  # Turn off axis labels and ticks (optional)
                    plt.title('Seg')
                    # Adjust the spacing between subplots
            
                    # Show the figure with the two subplots
                    plt.subplot(1, 3, 1)  # 1 row, 2 columns, first subplot
                    plt.imshow(mask[rmin:rmax, cmin:cmax])
                 
                    plt.axis('off')  # Turn off axis labels and ticks (optional)
                    plt.title(sum(mask_label.astype(int).flatten()))

                    plt.subplot(1, 3, 3)
                    plt.imshow(np.array(img)[rmin:rmax, cmin:cmax, :3])
                    plt.axis('off')  # Turn off axis labels and ticks (optional)
                    plt.title('RGB')
                    plt.tight_layout()
                    
                    plt.show()
                    """
                    if len(choose) > self.num_pt:
                        c_mask = np.zeros(len(choose), dtype=int)
                        c_mask[:self.num_pt] = 1
                        np.random.shuffle(c_mask)
                        choose = choose[c_mask.nonzero()]
                    else:
                        choose = np.pad(choose, (0, self.num_pt - len(choose)), 'wrap')
                
                    depth_masked = depth[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
                    xmap_masked = self.xmap[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
                    ymap_masked = self.ymap[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
                 
                    choose = np.array([choose])
                    pt2 = depth_masked / self.cam_scale
                    pt0 = (ymap_masked - cam_cx) * pt2 / cam_fx
                    pt1 = (xmap_masked - cam_cy) * pt2 / cam_fy
                    cloud = np.concatenate((pt0, pt1, pt2), axis=1)
                
                    """
                    fig1= plt.figure()
                    ax1 = fig1.add_subplot(projection='3d')
                    ax1.scatter(cloud[:,1], cloud[:,0], cloud[:,2],c='r')

                    ax1.set_xlabel('X')
                    ax1.set_ylabel('Y')
                    ax1.set_zlabel('Z')
                    """

                    if self.add_noise:
                        cloud = np.add(cloud, add_t)

                    #divide by 1000 to account for the fact that the input mesh (and so the point cloud) is in mm
                    model_points=self.cld[cld_id]
                    dellist = [k for k in range(0, len(model_points))]
                    dellist = random.sample(dellist, len(model_points) - self.num_pt_mesh_small)
                    model_points = np.delete(model_points, dellist, axis=0)
                    
                    target = np.dot(model_points, target_r.T)
                 
                    if self.add_noise:
                        target = np.add(target, target_t + add_t)
                    else:
                        target = np.add(target, target_t)
                    
                    fig2= plt.figure()
                    ax1 = fig2.add_subplot(projection='3d')
                    ax1.scatter(target[:,0],target[:,1], target[:,2],c='g')
                    ax1.scatter(cloud[:,0], cloud[:,1], cloud[:,2],c='r')

                    ax1.set_xlabel('X')
                    ax1.set_ylabel('Y')
                    ax1.set_zlabel('Z')
                    print(np.mean(target[:,0]),np.mean(target[:,1]), np.mean(target[:,2]))
                    print(np.mean(cloud[:,0]) ,np.mean(cloud[:,1]), np.mean(cloud[:,2]))
                    plt.show()
                    
                    cloud_list.append(torch.from_numpy(cloud.astype(np.float32)))
                    choose_list.append(torch.LongTensor(choose.astype(np.int32)))
                    img_list.append(self.norm(torch.from_numpy(img_obj.astype(np.float32))))
                    target_list.append(torch.from_numpy(target.astype(np.float32)))
                    model_points_list.append(torch.from_numpy(model_points.astype(np.float32)))
                    class_id_list.append(torch.LongTensor([int(cld_id)-1]))  
                            #seg_ids.append(object['segmentation_id'])
                            #indices.append(i)
                """else: 
                    print(f"Not enough points!! {len(mask.nonzero()[0])}")
                    cv2.imshow("test",mask.astype(np.uint8)*255)
                    cv2.waitKey(0)"""

        if self.mode=='train':
            return cloud_list, choose_list, img_list, target_list, model_points_list, class_id_list
        else:      
            return cloud_list, choose_list, img_list, target_list, model_points_list, class_id_list , self.image_list[index]
     #the index representing the classes
    
         

    def __len__(self):
        return self.length

    def get_sym_list(self):
        return self.symmetry_obj_idx

    def get_num_points_mesh(self):
        if self.refine:
            return self.num_pt_mesh_large
        else:
            return self.num_pt_mesh_small


border_list = [-1, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680]
img_width = 480
img_length = 640

def get_bbox(label):
    rows = np.any(label, axis=1)
    cols = np.any(label, axis=0)
    rmin, rmax = np.where(rows)[0][[0, -1]]
    cmin, cmax = np.where(cols)[0][[0, -1]]
    rmax += 1
    cmax += 1
    r_b = rmax - rmin
    for tt in range(len(border_list)):
        if r_b > border_list[tt] and r_b < border_list[tt + 1]:
            r_b = border_list[tt + 1]
            break
    c_b = cmax - cmin
    for tt in range(len(border_list)):
        if c_b > border_list[tt] and c_b < border_list[tt + 1]:
            c_b = border_list[tt + 1]
            break
    center = [int((rmin + rmax) / 2), int((cmin + cmax) / 2)]
    rmin = center[0] - int(r_b / 2)
    rmax = center[0] + int(r_b / 2)
    cmin = center[1] - int(c_b / 2)
    cmax = center[1] + int(c_b / 2)
    if rmin < 0:
        delt = -rmin
        rmin = 0
        rmax += delt
    if cmin < 0:
        delt = -cmin
        cmin = 0
        cmax += delt
    if rmax > img_width:
        delt = rmax - img_width
        rmax = img_width
        rmin -= delt
    if cmax > img_length:
        delt = cmax - img_length
        cmax = img_length
        cmin -= delt
    return rmin, rmax, cmin, cmax