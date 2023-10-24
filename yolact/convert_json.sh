#!/bin/bash
#set do_only_val to create only the json train file
do_only_train=$1

#set do_only_val to create only the json validation file
do_only_val=$2

python3 data/santal_dataset/convert_json.py --class-file data/santal_dataset/classes.txt $1 $2 --train-ann-directory data/santal_dataset/train_test \
--val-ann-directory data/santal_dataset/val_test --out-train-file data/santal_dataset/train_test.json --out-val-file data/santal_dataset/val_test.json
 