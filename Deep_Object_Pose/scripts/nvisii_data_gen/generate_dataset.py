#!/usr/bin/env python3
import random 
import subprocess


n_images_to_gen=10000
start_directory=200
n_images_per_directory=100
n_max_objects=10
n_max_distractors=5

input(f"generating {n_images_to_gen} images , starting {start_directory} , finishing {start_directory+n_images_to_gen//n_images_per_directory} and {n_images_to_gen//n_images_per_directory} directories")

for i in range(start_directory, start_directory+(n_images_to_gen//n_images_per_directory)):
	
	to_call = [
		"python3",'base_gen.py',
		'--nb_frames', str(n_images_per_directory),
		'--objs_folder' ,'models/santal_ace',
		'--spp','1000',
		'--width','640',
		'--height' ,'480',
		'--box_size', '0.3',
		'--max_force','5',
		'--nb_objects',str(int(random.uniform(2,n_max_objects))),
		'--nb_distractors',str(int(random.uniform(0,n_max_distractors))),
		'--scale', '0.001',
		'--visibility-fraction',
		'--outf',f"/mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/santal_juice_dataset_revisited/train/{str(i).zfill(3)}",
	]
	
	subprocess.call(to_call)

