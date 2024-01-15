#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore ./tools/my_train.py --dataset apple_dataset --dataset_root /mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/apple_dataset_revisited \
  --nepoch 100 --batch_size 32 
 