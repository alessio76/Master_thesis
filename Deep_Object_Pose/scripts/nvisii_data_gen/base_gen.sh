#!/bin/bash

python3 real_gen.py --objs_folder models/santal_ace --width 640 --spp 1000 --height 480 --box_size 0.3 --nb_frames 10 --scale 0.001 --nb_distractors 2 --nb_objects 6 \
--visibility-fraction  --outf output/output_example 
