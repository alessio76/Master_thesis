#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore train.py  --config=santal_config --resume weights/santal_51_270000.pth --batch_size 8 --cuda 1 --validation_size 8667 \
--validation_epoch 1 --max_failure 10 --lr 0.0001 