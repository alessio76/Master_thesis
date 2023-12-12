#!/bin/bash
#set do_only_val to create only the json train file
do_only_train=$1

#set do_only_val to create only the json validation file
do_only_val=$2

python3 data/santal_dataset/convert_json.py --class-file data/apple_dataset/classes.txt $1 $2 \
--train-ann-directory /mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/dataset_apple_7/train \
--val-ann-directory /mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/dataset_apple_7/val \
--out-train-file data/apple_dataset/train.json --out-val-file data/apple_dataset/val.json \
--supercategory apple
 