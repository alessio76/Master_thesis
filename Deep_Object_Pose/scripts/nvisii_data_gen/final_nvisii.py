from turtle import position
import nvisii
import random
import matplotlib.pyplot as plt
import json
import os
import open3d as o3d
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"
import glob
import cv2
from scipy.spatial.transform import Rotation as R
import numpy as np   
from mpl_toolkits.mplot3d import Axes3D 

opt = lambda: None
def set_camera(fov,width,height):
	# First, lets create an entity that will serve as our camera.
	camera = nvisii.entity.create(
        name = "camera",
        transform = nvisii.transform.create("camera"),
        camera = nvisii.camera.create_perspective_from_fov(
            name = "camera",
            field_of_view = 0.785398,
            aspect = float(width)/float(height)
        )
    )
	#for base_gen
	camera.get_transform().look_at(at = (0,0,1), up = (0,-1,0), eye = (0, 0, 0))
	
	nvisii.set_camera_entity(camera)
	
	return camera
	
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

opt.spp = 50 
opt.width = 640
opt.height = 480
fx=610.59326171875
fy=610.605712890625
cx= 320.0
cy=240.0
#default values for nvisii
fov=0.785398 #in radiants
opt.out = '01_simple_scene.png'
#in camera frame
cld=[]
class_id=1

base_path="models/santal_ace"
input_file=open(os.path.join(base_path,"santal_ace.xyz"))

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
cld = np.array(cld)/1000
input_file.close()
# headless - no window
# verbose - output number of frames rendered, etc..
nvisii.initialize(headless = True)

# Use a neural network to denoise ray traced
nvisii.enable_denoiser()

camera=set_camera(fov,opt.width ,opt.height)

mesh = nvisii.mesh.create_from_file("obj", os.path.join(base_path,"santal_centered.obj"))
tex=nvisii.texture.create_from_file("rgb", os.path.join(base_path,"textures","material0_baseColor.png"))
nvisii.set_dome_light_intensity(1)

dir=str(np.random.randint(199)).zfill(3)
print(dir)
for i,file in enumerate(glob.glob(f"/mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_juice_dataset_revisited/train/{dir}/0*.json")):
	json_file=open(file)
	data=json.load(json_file)


	for obj in data['objects']:
		if 'santal' in obj['name']:
			obj_pos=np.array(obj['location'])
			obj_ori=np.array(obj['quaternion_xyzw'])

			depth=cv2.imread(file.replace("json","depth.exr"),cv2.IMREAD_UNCHANGED)[:,:,0]
			seg=cv2.imread(file.replace("json","seg.exr"),cv2.IMREAD_UNCHANGED)[:,:,0]
			depth[depth<0]=0

			depth=depth_image_from_distance_image(depth,fx,fy,cx,cy)

			name=f"{obj['name']}_{i}"
			obj_entity = nvisii.entity.create(
				name=name,
				mesh = mesh,
				transform = nvisii.transform.create(name),
				material = nvisii.material.create(name)
			)
			obj_entity.get_transform().set_position(nvisii.vec3(obj_pos[0],obj_pos[1],obj_pos[2]))
			obj_entity.get_transform().set_rotation(nvisii.quat(obj_ori[3],obj_ori[0],obj_ori[1],obj_ori[2]))

			obj_entity.get_transform().set_scale(np.array((1,1,1))*0.001)  
			obj_entity.get_material().set_roughness(0.7) 
			obj_entity.get_material().set_base_color_texture(tex)
			seg_id=obj['segmentation_id']
			seg_mask=(seg==seg_id)
			"""
			fig1= plt.figure()
			ax1 = fig1.add_subplot()
			ax1.imshow(seg_mask)
			plt.show()
			"""
			xmap = np.array([[j for i in range(opt.width)] for j in range(480)])
			ymap = np.array([[i for i in range(opt.width)] for j in range(480)])
			depth_masked = depth[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			xmap_masked = xmap[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			ymap_masked = ymap[seg_mask].flatten()[:, np.newaxis].astype(np.float32)
			
			pt2 = depth_masked 
			pt0 = (ymap_masked - cx) * pt2 / fx 
			pt1 = (xmap_masked - cy) * pt2 / fy
			temp=np.array((pt0, pt1, pt2))
			#world_to_camera=np.array(((0,-1,0),(0,0,-1),(1,0,0)))
			cloud = np.concatenate(temp, axis=1)
			#cloud= cloud @ world_to_camera
				
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
			"""
			pointSet = o3d.geometry.PointCloud()
			pointSet.points = o3d.utility.Vector3dVector(target)

			pointSet2 = o3d.geometry.PointCloud()
			pointSet2.points = o3d.utility.Vector3dVector(cloud)

			#Visualize the two random points
			o3d.visualization.draw_geometries([pointSet, pointSet2])
			"""
	file_=file.split('/')
	print(file_[-1])
	nvisii.render_to_file(
	width = opt.width, 
	height = opt.height, 
	samples_per_pixel = opt.spp,   
	file_path = f"output/{file_[-1].replace('json','png')}"
	)

	json_file.close()
	nvisii.entity.clear_all()

nvisii.deinitialize()
