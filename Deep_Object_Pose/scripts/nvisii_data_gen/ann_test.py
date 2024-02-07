import random
import matplotlib.pyplot as plt
import json
import os
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"
import glob
import cv2
from scipy.spatial.transform import Rotation as R
import numpy as np   
from mpl_toolkits.mplot3d import Axes3D 

	
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

fx=610.59326171875
fy=610.605712890625
cx= 320.0
cy=240.0

#path to the directory containing the json files
json_file_dir = "/home/alessio/progetto_robotica/yolact_net/data/my_dataset/train/annotations"

#name of the object class (must be the same as in nvisii json annotation files)
obj_class = '002_master_chef_can'

#path to the point cloud path
point_cloud_path="/home/alessio/progetto_robotica/DenseFusion/datasets/my_dataset/YCB_Video_Models/models/002_master_chef_can/points.xyz"
cld=[]

input_file=open(point_cloud_path)

x = []
y = []
z = []
#store point cloud in order
while 1:
	input_line = input_file.readline()
	if not input_line:
		break
	input_line = input_line[:-1].split(' ')
	x.append(float(input_line[0]))
	y.append(float(input_line[1]))
	z.append(float(input_line[2]))
	cld.append([float(input_line[0]), float(input_line[1]), float(input_line[2])])
cld = np.array(cld)
input_file.close()

#selects all json files in json_file_dire directory
for i,file in enumerate(glob.glob(os.path.join(json_file_dir,"0*.json"))):
	json_file=open(file)
	data=json.load(json_file)

	for obj in data['objects']:
		if obj_class in obj['class']:
			#nvisii annotations
			obj_pos=np.array(obj['location'])
			obj_ori=np.array(obj['quaternion_xyzw'])

			depth=cv2.imread(file.replace("json","depth.exr"),cv2.IMREAD_UNCHANGED)[:,:,0]
			seg=cv2.imread(file.replace("json","seg.exr"),cv2.IMREAD_UNCHANGED)[:,:,0]
			depth[depth<0]=0

			depth=depth_image_from_distance_image(depth,fx,fy,cx,cy)

			seg_id=obj['segmentation_id']
			seg_mask=(seg==seg_id)
			"""
			fig1= plt.figure()
			ax1 = fig1.add_subplot()
			ax1.imshow(seg_mask)
			plt.show()
			"""
			xmap = np.array([[j for i in range(640)] for j in range(480)])
			ymap = np.array([[i for i in range(640)] for j in range(480)])
			depth_masked = depth[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			xmap_masked = xmap[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			ymap_masked = ymap[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			
			pt2 = depth_masked 
			pt0 = (ymap_masked - cx) * pt2 / fx 
			pt1 = (xmap_masked - cy) * pt2 / fy
			temp=np.array((pt0, pt1, pt2))
			cloud = np.concatenate(temp, axis=1)
				
			target_r=R.from_quat(obj_ori).as_matrix()
			target_t=np.array(obj_pos)
			
			dellist = [k for k in range(0, len(cld))]
			dellist = random.sample(dellist, len(cld) - 500)
			model_points = np.delete(cld, dellist, axis=0)
				
			target = np.dot(cld, target_r.T)
			target = np.add(target, target_t)
			
			fig1= plt.figure()
			ax1 = fig1.add_subplot(projection='3d')
			ax1.scatter(target[:,0], target[:,1], target[:,2],c='r')
			print(np.max(cloud[:,0]),np.max(cloud[:,1]),np.max(cloud[:,2]))
			print(np.max(target[:,0]),np.max(target[:,1]),np.max(target[:,2]))
			ax1.scatter(cloud[:,0], cloud[:,1], cloud[:,2],c='g')
			ax1.scatter(target_t[0],target_t[1],target_t[2],c='b')

			ax1.set_xlabel('X')
			ax1.set_ylabel('Y')
			ax1.set_zlabel('Z')

			plt.show()
			

	json_file.close()
