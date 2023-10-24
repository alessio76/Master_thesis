import json 
import os
import glob
os.environ["OPENCV_IO_ENABLE_OPENEXR"]="1"
#the enviromental variable must be set before importing cv2 otherwise nothing works
import cv2
import argparse
import numpy as np
from numpy import ma
import time
parser = argparse.ArgumentParser()

parser.add_argument(
    '--train-ann-directory',
    default="data/santal_dataset/train",
    help = 'train annotations directory path'
)

parser.add_argument(
    '--val-ann-directory',
    default="data/santal_dataset/val",
    help = 'val annotations directory path'
)

parser.add_argument(
    '--out-train-file',
    default='data/santal_dataset/train.json',
    help = 'output coco annotations for train set'
)

parser.add_argument(
    '--out-val-file',
    default='data/santal_dataset/val.json',
    help = 'output coco annotations for validation set'
)

parser.add_argument(
    '--class-file',
    default='classes.txt',
    help = 'categories file'
)

parser.add_argument(
    '--supercategory',
    default='santal_dataset'
)


parser.add_argument(
    '--do-only-val',
    default=False,
    dest='only_val',
    action='store_true',
    help = 'create only the val json file'
)


parser.add_argument(
    '--do-only-training',
    default=False,
    dest='only_train',
    action='store_true',
    help = 'create only the train json file'
)

opt = parser.parse_args()
image_dict=[]
category_dict=[]
annotations_dict=[]
categories=[]

"""
images = 1 annotation for every image
categories = 1 annotation for every category in the dataset
annotations = 1 annotation for every segmentation instance
"""
keys=("images","categories","annotations")

#define the keys for image subelement
"""
id = unique identifier of the image
width = width of the image
heigth = heigth of the image
file_name = name of hhte image file
coco_url (optional) = absolute path to the image file
"""
images_keys=('id','width','height',"file_name","coco_url")

#define the keys for annotation subelement
"""
segmentation = list of vertices of the contour of the object instance in the image
area = number of visible pixels
iscrowd = unused
image_id = id of the image that is beeing annotatedù
bbox = bounding box AS [X,Y,WIDTH,HEIGTH] (X = x coordinate of the top-left corner, Y = y coordinate of the top-left corner, width = width of the box, heigth = heigth of the box)
category_id = id of the category the segmentation annotation belongs to
id = unique identifier of the annotation
"""
annotation_keys=('segmentation','area','iscrowd','image_id','bbox','category_id',"id")
supercategory=opt.supercategory
start_time=time.time()
#read class names
with open(opt.class_file) as class_file:
    categories=class_file.readlines()
    categories=[category.replace('\n',"") for category in categories]

#create the category entries in the json file
for i,category in enumerate(categories,start=1):
	category_dict.append({"supercategory": supercategory, "id": i, "name": category})
	
#store directory and file info for train and validation
info_list=[]

if opt.train_ann_directory is not None and not(opt.only_val):
	train_dict={'input_directory':opt.train_ann_directory, 'out_file':opt.out_train_file}
	info_list.append(train_dict)


if opt.val_ann_directory is not None and not(opt.only_train):
	val_dict={'input_directory':opt.val_ann_directory, 'out_file':opt.out_val_file}
	info_list.append(val_dict)

#used as image id
total_images=0

#used as annotation id
ann_ids=0
for info in info_list:
	
	#explore all the directories that contain images
	for dir in os.listdir(info['input_directory']):
		json_file_names=glob.glob(os.path.join(info['input_directory'],dir,"0*.json"))
		
		#json file given by nvisii
		for i,json_file_name in enumerate(json_file_names,start=1):
			
			num_objects=0
			total_images+=1
			with open(json_file_name) as json_file:
				data = json.load(json_file)
				#create the image sublement using path and file_name
				coco_url=os.path.join(os.path.abspath(os.getcwd()),json_file_name.replace(".json",".png"))
				file_name=json_file_name.replace(f"{info['input_directory']}/","")
				image_dict.append(dict(zip(images_keys,(total_images,data['camera_data']['width'],data['camera_data']['height'],file_name.replace(".json",".png"),coco_url))))

			#read the segmentation masks
			seg_path=os.path.join(info['input_directory'],file_name.split(".")[0]+".seg.exr")
			seg=cv2.imread(seg_path,cv2.IMREAD_UNCHANGED)[:,:,0]

			#for every object in the image
			for object_dict in data['objects']:
				#select the objects of interest
				if object_dict['class'] in categories:
				
					#in seg each mask is filled with an integer which is the id of the specifc object, so first
					#read the id of that object from the json input file and then use that id to identify the mask of that object
					seg_id=object_dict['segmentation_id']
					obj_mask=(seg == seg_id).astype(np.uint8)*255
								
					#cv2 function to calculate contour of the object
					contours= cv2.findContours(obj_mask, cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)[0]
					assert len(contours)!=0, f"no contour detected,{contours}"

					#each element of this list is the number of row (number of points) of each contour 
					contours_rows=[contour.shape[0] for contour in contours]
					
					
					coco_coordinates=[]
					index=next(item for item in category_dict if item["name"] == object_dict['class'])['id']
					for border in contours:
							rows=border.shape[0]
							
							#add an annotation only if the border of the object has more than 2 points 
							#(the number of points is equal to the number of rows of that border)
							if rows>2:
								num_objects+=1
								ann_ids+=1
								coco_coordinates.append(border.reshape(rows*2).tolist())
								
								#reorder bbox coordinate in the order expected by COCO
								top_left_x = object_dict['bounding_box_minx_maxx_miny_maxy'][0]
								top_left_y = object_dict['bounding_box_minx_maxx_miny_maxy'][2]
								bottom_right_x = object_dict['bounding_box_minx_maxx_miny_maxy'][1]
								bottom_rigth_y = object_dict['bounding_box_minx_maxx_miny_maxy'][3]
								rect_width = bottom_right_x -  top_left_x
								rect_height = bottom_rigth_y - top_left_y 
								bbox=(top_left_x,top_left_y,rect_width,rect_height)

								area=len(np.where(seg == seg_id)[0])
								assert area!=0,"area = 0"

								iscrowd=0
								#create the annotations subelement
								annotations_dict.append(dict(zip(annotation_keys,(coco_coordinates,area,iscrowd,total_images,bbox,index,ann_ids))))

	final_time=time.time()-start_time				
	#put all togheter the dict for the subelement to form the final json			
	final_dict=dict(zip(keys,(image_dict,category_dict,annotations_dict)))
	with open(info['out_file'], 'w') as outfile:   
		#outfile.write(json.dumps(final_dict,indent=4,sort_keys=True))
		json.dump(final_dict,outfile)
		final_dict.clear()
		annotations_dict.clear()
		image_dict.clear()
				
		

	


