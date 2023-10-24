import argparse
import sys
sys.path.append('/home/workstation2/AlessioBenitoAlterani/Master-thesis/yolact')
import copy
import numpy as np
from mpl_toolkits.mplot3d import Axes3D 
import numpy.ma as ma
import torch
import torch.nn as nn
import os
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"
import torch.nn.parallel
import torch.backends.cudnn as cudnn
import torch.optim as optim
import json
import torch.utils.data
import torchvision.datasets as dset
import torchvision.transforms as transforms
import torchvision.utils as vutils
import torch.nn.functional as F
from torch.autograd import Variable
from lib.network import PoseNet, PoseRefineNet
from lib.transformations import quaternion_matrix, quaternion_from_matrix
import cv2
import matplotlib.pyplot as plt
from data import COCODetection, get_label_map, MEANS, COLORS, cfg, set_cfg, set_dataset
from yolact import Yolact
from utils.augmentations import BaseTransform, FastBaseTransform, Resize
from layers.box_utils import jaccard, center_size, mask_iou
from utils import timer
from scipy.spatial.transform import Rotation
from utils.functions import SavePath
from layers.output_utils import postprocess, undo_image_transformation
from collections import defaultdict



def prep_display(dets_out, img, h, w, args,undo_transform=True, class_color=False, mask_alpha=0.45, fps_str=''):
    """
    Note: If undo_transform=False then im_h and im_w are allowed to be None.
    """
 
    if undo_transform:
        img_numpy = undo_image_transformation(img, w, h)
        img_gpu = torch.Tensor(img_numpy).cuda()
    else:
        img_gpu = img / 255.0
        h, w, _ = img.shape
    
    with timer.env('Postprocess'):
        save = cfg.rescore_bbox
        cfg.rescore_bbox = True
        cfg.mask_proto_debug = False
        t = postprocess(dets_out, w, h, visualize_lincomb = False,
                                        crop_masks        = args.crop,
                                        score_threshold   = args.score_threshold)
     
        

    with timer.env('Copy'):
        idx = t[1].argsort(0, descending=True)[:args.top_k]
        
        if cfg.eval_mask_branch:
            # Masks are drawn on the GPU, so don't copy
            masks = t[3][idx]
        classes, scores, boxes = [x[idx].cpu().numpy() for x in t[:3]]
    num_dets_to_consider = min(args.top_k, classes.shape[0])
    for j in range(num_dets_to_consider):
        if scores[j] < args.score_threshold:
            num_dets_to_consider = j
            break

    # Quick and dirty lambda for selecting the color for a particular index
    # Also keeps track of a per-gpu color cache for maximum speed
    def get_color(j, on_gpu=None):
        global color_cache
        color_idx = (classes[j] * 5 if class_color else j * 5) % len(COLORS)
        
        if on_gpu is not None and color_idx in color_cache[on_gpu]:
            return color_cache[on_gpu][color_idx]
        else:
            color = COLORS[color_idx]
            if not undo_transform:
                # The image might come in as RGB or BRG, depending
                color = (color[2], color[1], color[0])
            if on_gpu is not None:
                color = torch.Tensor(color).to(on_gpu).float() / 255.
                color_cache[on_gpu][color_idx] = color
            return color

    # First, draw the masks on the GPU where we can do it really fast
    # Beware: very fast but possibly unintelligible mask-drawing code ahead
    # I wish I had access to OpenGL or Vulkan but alas, I guess Pytorch tensor operations will have to suffice
    if args.display_masks and cfg.eval_mask_branch and num_dets_to_consider > 0:
        # After this, mask is of size [num_dets, h, w, 1]
        masks = masks[:num_dets_to_consider, :, :, None]
        
        # Prepare the RGB images for each mask given their color (size [num_dets, h, w, 1])
        colors = torch.cat([get_color(j, on_gpu=img_gpu.device.index).view(1, 1, 1, 3) for j in range(num_dets_to_consider)], dim=0)
        masks_color = masks.repeat(1, 1, 1, 3) * colors * mask_alpha

        # This is 1 everywhere except for 1-mask_alpha where the mask is
        inv_alph_masks = masks * (-mask_alpha) + 1
        
        # I did the math for this on pen and paper. This whole block should be equivalent to:
        #    for j in range(num_dets_to_consider):
        #        img_gpu = img_gpu * inv_alph_masks[j] + masks_color[j]
        masks_color_summand = masks_color[0]
        if num_dets_to_consider > 1:
            inv_alph_cumul = inv_alph_masks[:(num_dets_to_consider-1)].cumprod(dim=0)
            masks_color_cumul = masks_color[1:] * inv_alph_cumul
            masks_color_summand += masks_color_cumul.sum(dim=0)

        img_gpu = img_gpu * inv_alph_masks.prod(dim=0) + masks_color_summand
    
    if args.display_fps:
            # Draw the box for the fps on the GPU
        font_face = cv2.FONT_HERSHEY_DUPLEX
        font_scale = 0.6
        font_thickness = 1

        text_w, text_h = cv2.getTextSize(fps_str, font_face, font_scale, font_thickness)[0]

        img_gpu[0:text_h+8, 0:text_w+8] *= 0.6 # 1 - Box alpha


    # Then draw the stuff that needs to be done on the cpu
    # Note, make sure this is a uint8 tensor or opencv will not anti alias text for whatever reason
    img_numpy = (img_gpu * 255).byte().cpu().numpy()

    if args.display_fps:
        # Draw the text on the CPU
        text_pt = (4, text_h + 2)
        text_color = [255, 255, 255]

        cv2.putText(img_numpy, fps_str, text_pt, font_face, font_scale, text_color, font_thickness, cv2.LINE_AA)
    
    if num_dets_to_consider == 0:
        return img_numpy

    if args.display_text or args.display_bboxes:
        for j in reversed(range(num_dets_to_consider)):
            x1, y1, x2, y2 = boxes[j, :]
            color = get_color(j)
            score = scores[j]

            if args.display_bboxes:
                cv2.rectangle(img_numpy, (x1, y1), (x2, y2), color, 1)

            if args.display_text:
                _class = cfg.dataset.class_names[classes[j]]
                text_str = '%s: %.2f' % (_class, score) if args.display_scores else _class

                font_face = cv2.FONT_HERSHEY_DUPLEX
                font_scale = 0.6
                font_thickness = 1

                text_w, text_h = cv2.getTextSize(text_str, font_face, font_scale, font_thickness)[0]

                text_pt = (x1, y1 - 3)
                text_color = [255, 255, 255]

                cv2.rectangle(img_numpy, (x1, y1), (x1 + text_w, y1 - text_h - 4), color, -1)
                cv2.putText(img_numpy, text_str, text_pt, font_face, font_scale, text_color, font_thickness, cv2.LINE_AA)
            
    
    return img_numpy,boxes,masks.cpu().numpy(),classes

def str2bool(v):
    if v.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif v.lower() in ('no', 'false', 'f', 'n', '0'):
        return False
    else:
        raise argparse.ArgumentTypeError('Boolean value expected.')

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

def create_annotations_path(path,png_replacement):
    #basically substitute png with whatever desidered value
    #json,depth.exr,seg.exr and img with annotations in the path 
    sub_dict={'png':str(png_replacement)}
    temp=path

    for old,new in sub_dict.items():
        temp=temp.replace(old,new)

    return temp 


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

    
#dense fusion args
parser = argparse.ArgumentParser()
parser.add_argument('--model', type=str, default = 'trained_models/santal_dataset/pose_model_7_0.05715361642802047.pth',  help='resume PoseNet model')
parser.add_argument('--refine_model', type=str, default = '',  help='resume PoseRefineNet model')

# yolact args
parser.add_argument('--trained_model',default='/home/workstation2/AlessioBenitoAlterani/Master-thesis/yolact/weights/santal_55_290000_mAP_8_89.pth', type=str,
                    help='Trained state_dict file path to open. If "interrupt", this will open the interrupt file.')
parser.add_argument('--top_k', default=5, type=int,
                        help='Further restrict the number of predictions to parse')
parser.add_argument('--cuda', default=True, type=str2bool,
                    help='Use cuda to evaulate model')
parser.add_argument('--cross_class_nms', default=True, type=str2bool,
                    help='Whether compute NMS cross-class or per-class.')
parser.add_argument('--fast_nms', default=True, type=str2bool,
                    help='Whether to use a faster, but not entirely correct version of NMS.')
parser.add_argument('--display_masks', default=True, type=str2bool,
                    help='Whether or not to display masks over bounding boxes')
parser.add_argument('--display_bboxes', default=True, type=str2bool,
                    help='Whether or not to display bboxes around masks')
parser.add_argument('--display_text', default=True, type=str2bool,
                    help='Whether or not to display text (class [score])')
parser.add_argument('--display_scores', default=True, type=str2bool,
                    help='Whether or not to display scores in addition to classes')
parser.add_argument('--display', dest='display', action='store_true',
                    help='Display qualitative results instead of quantitative ones.')
parser.add_argument('--output_coco_json', dest='output_coco_json', action='store_true',
                    help='If display is not set, instead of processing IoU values, this just dumps detections into the coco json file.')
parser.add_argument('--bbox_det_file', default='results/bbox_detections.json', type=str,
                    help='The output file for coco bbox results if --coco_results is set.')
parser.add_argument('--mask_det_file', default='results/mask_detections.json', type=str,
                    help='The output file for coco mask results if --coco_results is set.')
parser.add_argument('--seed', default=None, type=int,
                    help='The seed to pass into random.seed. Note: this is only really for the shuffle and does not (I think) affect cuda stuff.')
parser.add_argument('--no_crop', default=False, dest='crop', action='store_false',
                    help='Do not crop output masks with the predicted bounding box.')
parser.add_argument('--image', default=None, type=str,
                    help='A path to an image to use for display.')
parser.add_argument('--images', default=None, type=str,
                    help='An input folder of images and output folder to save detected images. Should be in the format input->output.')
parser.add_argument('--video', default=None, type=str,
                    help='A path to a video to evaluate on. Passing in a number will use that index webcam.')
parser.add_argument('--score_threshold', default=0.7, type=float,
                    help='Detections with a score under this threshold will not be considered. This currently only works in display mode.')
parser.add_argument('--display_fps', default=False, dest='display_fps', action='store_true',
                    help='When displaying / saving video, draw the FPS on the frame')
parser.add_argument('--mask_proto_debug', default=False, dest='mask_proto_debug', action='store_true',
                        help='Outputs stuff for scripts/compute_mask.py.')

parser.set_defaults(no_bar=False, display=False, resume=False, output_coco_json=False, output_web_json=False,
                    shuffle=False,
                    benchmark=False, no_sort=False, no_hash=False, mask_proto_debug=False, crop=True, detect=False,
                    display_fps=False,
                    emulate_playback=False)


opt = parser.parse_args()

color_cache = defaultdict(lambda: {})
norm = transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
border_list = [-1, 40, 80, 120, 160, 200, 240, 280, 320, 360, 400, 440, 480, 520, 560, 600, 640, 680]
xmap = np.array([[j for i in range(640)] for j in range(480)])
ymap = np.array([[i for i in range(640)] for j in range(480)])
cam_cx = 317.7075500488281
cam_cy = 238.1421356201172
cam_fx = 610.59326171875
cam_fy = 610.605712890625



json_annotation_path=create_annotations_path(opt.image,'json')
#json_annotation_path=opt.image.replace('png','json')
pose_annotations=json.load(open(json_annotation_path))
world_to_camera_matrix=np.array(pose_annotations['camera_data']['camera_view_matrix'])
camera_to_world_matrix=np.linalg.inv(world_to_camera_matrix)


img_width = 480
img_length = 640
num_points = 1000
num_points_mesh = 500
iteration = 0
bs = 1
dataset_config_dir = 'datasets/santal_dataset/dataset_config'

color = [[255, 255, 255], [0, 255, 0], [255, 0, 0], [0, 0, 255], [255, 255, 0],
              [255, 0, 255], [0, 255, 255], [128, 0, 0], [0, 128, 0], [0, 0, 128],
              [251, 194, 44], [240, 20, 134], [160, 103, 173], [70, 163, 210], [140, 227, 61],
              [128, 128, 0], [128, 0, 128], [0, 128, 128], [64, 0, 0], [0, 64, 0], [0, 0, 64]]

"""class_name = ['master_chef_can', 'cracker_box', 'sugar_box', 'tomato_soup_can', 'mustard_bottle', 'tuna_fish_can', 'pudding_box', 'gelatin_box',
              'potted_meat_can', 'banana', 'pitcher_base', 'bleach_cleanser', 'bowl', 'mug', 'power_drill', 'wood_block', 'scissors', 'large_marker',
              'large_clamp', 'extra_large_clamp', 'foam_brick']"""

#since we use the same ycb classes use the same .txt file
class_file = open('datasets/santal_dataset/dataset_config/classes.txt')
class_id = 1
cld = {}
class_dict = {}
while 1:
    class_input = class_file.readline().replace('\n',"")
    #add the read classes in the vector of the classes of interest
    if not class_input:
        break
    #complete point cloud of each object
    #input_file = open('{0}/YCB_Video_Models/models/{1}/points.xyz'.format(root, class_input))
    input_file=open(os.path.join("/mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset",f"{class_input}",f"{class_input}.xyz"))
    class_dict[class_input]=class_id
    cld[class_id] = []
    #store point cloud in order
    while 1:
        input_line = input_file.readline()
        if not input_line:
            break
        input_line = input_line[:-1].split(' ')
        temp=np.array([float(input_line[0]), float(input_line[1]), float(input_line[2])])/1000
        cld[class_id].append(list(temp))
    cld[class_id] = np.array(cld[class_id])
    input_file.close()
    
    class_id += 1


"""fig1= plt.figure()
ax1 = fig1.add_subplot(projection='3d')
img_plt = ax1.scatter(cld[1][:,0], cld[1][:,1], cld[1][:,2])

ax1.set_xlabel('X')
ax1.set_ylabel('Y')
ax1.set_zlabel('Z')

plt.show()"""
num_obj = 1
estimator = PoseNet(num_points = num_points, num_obj = num_obj)
estimator.cuda()
estimator.load_state_dict(torch.load(opt.model))
estimator.eval()

if opt.refine_model != '':
    refiner = PoseRefineNet(num_points = num_points, num_obj = num_obj)
    refiner.cuda()
    refiner.load_state_dict(torch.load(opt.refine_model))
    refiner.eval()

yolact = Yolact()
yolact.load_weights(opt.trained_model)
yolact.eval()
yolact.cuda()

torch.set_default_tensor_type('torch.cuda.FloatTensor')
yolact.detect.use_fast_nms = opt.fast_nms
yolact.detect.use_cross_class_nms = opt.cross_class_nms

if torch.cuda.is_available():
    device = torch.device('cuda:0')
else:
    device = torch.device('cpu')
    
class_file = open('{0}/classes.txt'.format(dataset_config_dir))

rgb_image_path = opt.image
img = cv2.imread(rgb_image_path)
rgbd_image_path = create_annotations_path(rgb_image_path,'depth.exr')
#rgbd_image_path=opt.image.replace('png','depth.exr')
depth=cv2.imread(rgbd_image_path,cv2.IMREAD_UNCHANGED)[:,:,0]
depth[depth<-100]=0
depth[depth>3]=0
depth=depth_image_from_distance_image(depth,cam_fx,cam_fy,cam_cx,cam_cy)


"""cv2.namedWindow("depth",cv2.WINDOW_AUTOSIZE)
cv2.imshow("depth",depth)
cv2.waitKey()

cv2.namedWindow("rgb",cv2.WINDOW_AUTOSIZE)
cv2.imshow("rgb",img)
cv2.waitKey()
"""

with torch.no_grad():
    frame = torch.from_numpy(img).cuda().float()
    batch = FastBaseTransform()(frame.unsqueeze(0))
    preds = yolact(batch)

    img_numpy,boxes,masks,classes = prep_display(preds, frame, None, None, undo_transform=False,args=opt)
    img_numpy = np.array(img_numpy)[:, :, :3]
    img_numpy.astype(np.float32)
    cv2.imshow("yolact detection", img_numpy)
    cv2.waitKey(0)
    my_result_wo_refine = []
    my_result = []
 
    #since classes as one element for each object this means for each object 
    #in the scene
    for index in range(len(classes)):
        #cuboid=np.array(pose_annotations['objects'][index]['projected_cuboid']).astype(int)[0:-1,:].T
        target_t = np.array(pose_annotations['objects'][index]['location'])
        target_r = np.array(pose_annotations['objects'][index]['quaternion_xyzw'])
        target_r= Rotation.from_quat(target_r)
        itemid = classes[index] + 1
        box = boxes[index]

        mask_depth = (depth != 0)
        mask_label = masks[index, :, :, 0]
        mask = mask_label * mask_depth
        rmin, rmax, cmin, cmax = get_bbox(mask_label)
        choose = mask[rmin:rmax, cmin:cmax].flatten().nonzero()[0]
             #rmin, rmax, cmin, cmax = get_bbox(box[0], box[1], box[2], box[3])
        
       
        if len(choose) > num_points:
            c_mask = np.zeros(len(choose), dtype=int)
            c_mask[:num_points] = 1
            np.random.shuffle(c_mask)
            choose = choose[c_mask.nonzero()]
        else:
            choose = np.pad(choose, (0, num_points - len(choose)), 'wrap')
        
        img_masked = np.array(img)[:, :, :3]
        img_masked = np.transpose(img_masked, (2, 0, 1))
        img_masked = img_masked[:, rmin:rmax, cmin:cmax]
        """
        cv2.namedWindow("mask_rgb",cv2.WINDOW_AUTOSIZE)
        cv2.imshow("mask_rgb",img[rmin:rmax,cmin:cmax])
        cv2.waitKey()
        cv2.namedWindow("mask_depth",cv2.WINDOW_AUTOSIZE)
        cv2.imshow("mask_depth",depth[rmin:rmax, cmin:cmax])
        cv2.waitKey()
        """
        depth_masked = depth[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
        xmap_masked = xmap[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
        ymap_masked = ymap[rmin:rmax, cmin:cmax].flatten()[choose][:, np.newaxis].astype(np.float32)
        
        
        choose = np.array([choose])
        cam_scale=1
        pt2 = depth_masked / cam_scale
        pt0 = (ymap_masked - cam_cx) * pt2 / cam_fx
        pt1 = (xmap_masked - cam_cy) * pt2 / cam_fy
        cloud_numpy = np.concatenate((pt0, pt1, pt2), axis=1)
        cloud=cloud_numpy
        """
        fig= plt.figure()
        ax = fig.add_subplot(projection='3d')
        img_plt = ax.scatter(cloud[:,0], cloud[:,1], cloud[:,2])

        ax.set_xlabel('X')
        ax.set_ylabel('Y')
        ax.set_zlabel('Z')

        plt.show()
        """
        cloud = torch.from_numpy(cloud.astype(np.float32))
        choose = torch.LongTensor(choose.astype(np.int32))
        img_masked = norm(torch.from_numpy(img_masked.astype(np.float32)))
        index = torch.LongTensor([itemid - 1])

        cloud = Variable(cloud).cuda()
        choose = Variable(choose).cuda()
        img_masked = Variable(img_masked).cuda()
        index = Variable(index).cuda()

        cloud = cloud.view(1, num_points, 3)
    
        img_masked = img_masked.view(1, 3, img_masked.size()[1], img_masked.size()[2])

        pred_r, pred_t, pred_c, emb = estimator(img_masked, cloud, choose, index)
        pred_r = pred_r / torch.norm(pred_r, dim=2).view(1, num_points, 1)

        pred_c = pred_c.view(bs, num_points)
        how_max, which_max = torch.max(pred_c, 1)
        pred_t = pred_t.view(bs * num_points, 1, 3)
        points = cloud.view(bs * num_points, 1, 3)
        
        my_r = pred_r[0][which_max[0]].view(-1).cpu().data.numpy()
        
        my_t = (points + pred_t)[which_max[0]].view(-1).cpu().data.numpy()
        my_pred = np.append(my_r, my_t)
        my_result_wo_refine.append(my_pred.tolist())

        for ite in range(0, iteration):
            T = Variable(torch.from_numpy(my_t.astype(np.float32))).cuda().view(1, 3).repeat(num_points, 1).contiguous().view(1, num_points, 3)
            my_mat = quaternion_matrix(my_r)
            R = Variable(torch.from_numpy(my_mat[:3, :3].astype(np.float32))).cuda().view(1, 3, 3)
            my_mat[0:3, 3] = my_t

            new_cloud = torch.bmm((cloud - T), R).contiguous()
            pred_r, pred_t = refiner(new_cloud, emb, index)
            pred_r = pred_r.view(1, 1, -1)
            pred_r = pred_r / (torch.norm(pred_r, dim=2).view(1, 1, 1))
            my_r_2 = pred_r.view(-1).cpu().data.numpy()
            my_t_2 = pred_t.view(-1).cpu().data.numpy()
            my_mat_2 = quaternion_matrix(my_r_2)

            my_mat_2[0:3, 3] = my_t_2

            my_mat_final = np.dot(my_mat, my_mat_2)
            my_r_final = copy.deepcopy(my_mat_final)
            my_r_final[0:3, 3] = 0
            my_r_final = quaternion_from_matrix(my_r_final, True)
            my_t_final = np.array([my_mat_final[0][3], my_mat_final[1][3], my_mat_final[2][3]])

            my_pred = np.append(my_r_final, my_t_final)
            my_r = my_r_final
            my_t = my_t_final

        print("****predictions***")
        print("t", my_t)
        #print("R_eul", Rotation.from_quat(my_r).as_euler('xyz',degrees=True))
        print("R_quat",my_r)
        print("****targets*****")
        print("t", target_t)
        print("R", target_r.as_quat())
        print("****distances*****")
        print(np.linalg.norm(target_t-my_t))
        """rvec=target_r.as_rotvec()
        rotvec, _ = cv2.Rodrigues(rvec)"""
        my_r=quaternion_matrix(my_r)[:3,:3]
        print("\n")
        model_points =cld[itemid]

        pred = np.dot(model_points,target_r.as_matrix().T) + target_t

        fig1= plt.figure()
        ax1 = fig1.add_subplot(projection='3d')
        img_plt = ax1.scatter(pred[:,0], pred[:,1], pred[:,2],c='r',label="gt")

        ax1.set_xlabel('X')
        ax1.set_ylabel('Y')
        ax1.set_zlabel('Z')
        #ax1 = fig1.add_subplot(projection='3d')
      
        pred = np.dot(model_points,my_r.T) + my_t
     
        img_plt = ax1.scatter(pred[:,0], pred[:,1], pred[:,2],c='g',label="estimated")
        #img_plt = ax1.scatter(pred[0,:], pred[1,:], pred[2,:],c='g',label="estimated")

        ax1.set_xlabel('X')
        ax1.set_ylabel('Y')
        ax1.set_zlabel('Z')
        ax1.legend()
        plt.show()

       

       
