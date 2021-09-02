#!/bin/bash

# freeze.sh
#   Freezes trained model.
#
# author: Everett
# created: 2021-08-27 06:46
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

TRAINING_DIRECTORY="$wd/models/training"
PIPELINE_CONFIG="$TRAINING_DIRECTORY/pipeline.config"

EXPORT_DIRECTORY="$wd/models/exported"
TF_EXPORT_SCRIPT="$wd/external/models/research/object_detection/exporter_main_v2.py"

python3 "$TF_EXPORT_SCRIPT"  --input_type=image_tensor --pipeline_config_path="$PIPELINE_CONFIG" --trained_checkpoint_dir="$TRAINING_DIRECTORY" --output_directory="$EXPORT_DIRECTORY"
