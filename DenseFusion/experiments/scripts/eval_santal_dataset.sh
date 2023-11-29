#!/bin/bash
#evaluate my dataset

set +x
set -e

export PYTHONUNBUFFERED="True"
export CUDA_VISIBLE_DEVICES=0

python3 -W ignore ./tools/eval_santal_dataset.py --dataset_root /mnt/d1382ef8-acda-4cd4-ae67-0a971abc01c8/dope_dataset\
  --model trained_models/santal_dataset/pose_model_31_0.02415213751335093.pth\
  --iteration 0\
  --display 1\
  --ADD
  #--refine_model trained_models/santal_dataset/pose_refine_model_72_0.024081433345069177.pth\
  #--AUC 
  #--dis_target 0.02\

  
  #--refine_model trained_models/santal_dataset/pose_refine_model_116_0.01558202758204158.pth\
  #--calculate_AUC 1 set to 0 to calculate only the ADD>2cm metric
  #--calculate_ADD 1
