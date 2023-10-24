#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore train.py  --config=santal_config --resume weights/santal_54_282780_interrupt.pth --batch_size 8 --cuda 1 --validation_size 3913 \
--validation_epoch 1 --max_failure 5 --lr 0.0002 --mAP 8.90 --decay 0.001