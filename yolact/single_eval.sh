#!/bin/bash
python3 -W "ignore" yolact_test.py --display --cuda 1 --trained_model weights/santal_43_225592_interrupt.pth --image $1 --cross_class_nms 1 
