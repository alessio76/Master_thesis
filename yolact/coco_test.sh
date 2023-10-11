#!/bin/bash
#set show_imgs to --show-img to show the images, nothing to check only if the annotations are correctly formed
show_imgs=$2

#annotation file name to inspect
ann_file=$1

python3 data/santal_dataset/coco_test.py --ann-file data/santal_dataset/$1 $2 
