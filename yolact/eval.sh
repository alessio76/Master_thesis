#!/bin/bash
####  IF YOU PASS 2 ARGUMENTS
#1 argument= input image directory
#2 argument= out directory to store detections
####

### IF YOU PASS ONLY ONE ARGUMENT
#1=image to make prediction on
######


### IF no argument are passed perform only numeric evaluation
#1=image to make prediction on
######

if [ "$#" -eq 2 ];then
python3  -W ignore eval.py --display --cuda 1 --trained_model weights/santal_43_225592_interrupt.pth --images $1:$2 --cross_class_nms 1 --score_threshold 0.5

elif [ "$#" -eq 1 ]; then
python3 -W ignore eval.py --cuda 1 --trained_model weights/santal_43_225592_interrupt.pth --image $1 --display --cross_class_nms 1

elif [ "$#" -eq 0 ]; then
python3 -W ignore eval.py --cuda 1 --trained_model weights/santal_51_270000_mAP_8.99.pth 
fi



