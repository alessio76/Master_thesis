#!/bin/bash

if [[ $1 ]]
 then
python3 eval.py --display --cuda 1 --trained_model weights/santal_20_104600.pth --images $1:$2 --cross_class_nms 1 --score_threshold 0.5
else python3 -W ignore eval.py --cuda 1 --trained_model weights/santal_20_104600.pth 
fi



