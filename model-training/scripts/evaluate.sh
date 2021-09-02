#!/bin/bash

# evaluate.sh
#   Evaluates the trained model.
#
# author: Everett
# created: 2021-08-27 06:01
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

TRAINING_DIRECTORY="$wd/models/training"
PIPELINE_CONFIG="$TRAINING_DIRECTORY/pipeline.config"
TF_TRAINING_SCRIPT="$wd/external/models/research/object_detection/model_main_tf2.py"

python3 "$TF_TRAINING_SCRIPT" --model_dir="$TRAINING_DIRECTORY" --pipeline_config_path="$PIPELINE_CONFIG" --checkpoint_dir="$MODEL_DIRECTORY"
