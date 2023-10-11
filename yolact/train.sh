#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore train.py  --config=santal_config  --batch_size 8 --cuda 1 --validation_size 3913
