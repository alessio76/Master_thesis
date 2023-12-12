#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore train.py  --config=apple_config --batch_size 8 --cuda 1 --validation_size 6102 \
--validation_epoch 1 --max_failure 15 --lr 0.001 --tensorflow_dir logs/apple_session --resume /mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset/dataset_apple_7/yolact/weights/apple_5_80000.pth \
--start_iter 80000 --mAP 28.61