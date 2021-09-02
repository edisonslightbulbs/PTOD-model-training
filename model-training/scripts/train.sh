#!/bin/bash

# train.sh
#   Trains object detection model
#
# author: Everett
# created: 2021-08-27 06:22
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

TRAINING_STEPS=2000
TRAINING_DIRECTORY="$wd/models/training"
PIPELINE_CONFIG="$TRAINING_DIRECTORY/pipeline.config"
TF_TRAINING_SCRIPT="$wd/external/models/research/object_detection/model_main_tf2.py"

# clean training directory
rm -rf "$TRAINING_DIRECTORY/checkpoint"  >/dev/null 2>&1
rm -rf "$TRAINING_DIRECTORY/*.index"  >/dev/null 2>&1
rm -rf "$TRAINING_DIRECTORY/*.data*"  >/dev/null 2>&1

python3 "$TF_TRAINING_SCRIPT" --model_dir="$TRAINING_DIRECTORY" --pipeline_config_path="$PIPELINE_CONFIG" --num_train_steps="$TRAINING_STEPS"
