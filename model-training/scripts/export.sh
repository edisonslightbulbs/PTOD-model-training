#!/bin/bash

# export.sh
#   Exports trained model in tfjs and tflite formats.
#
# author: Everett
# created: 2021-08-27 06:47
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

MODELS_DIRECTORY="$wd/models"
EXPORT_DIRECTORY="$MODELS_DIRECTORY/exported"
TRAINING_DIRECTORY="$MODELS_DIRECTORY/training"
PIPELINE_CONFIG="$TRAINING_DIRECTORY/pipeline.config"

TFJS_DIRECTORY="$EXPORT_DIRECTORY/tfjs"
TFLITE_DIRECTORY="$EXPORT_DIRECTORY/tflite"
SAVED_MODEL="$EXPORT_DIRECTORY/tflite/saved_model"
TFLITE_EXPORT_SCRIPT="$wd/external/models/research/object_detection/export_tflite_graph_tf2.py"

OUTPUTARRAYS='TFLite_Detection_PostProcess','TFLite_Detection_PostProcess:1','TFLite_Detection_PostProcess:2','TFLite_Detection_PostProcess:3'
NODES='detection_boxes,detection_classes,detection_features,detection_multiclass_scores,detection_scores,num_detections,raw_detection_boxes,raw_detection_scores'


echo "-- exporting model in  tfjs format"
tensorflowjs_converter --input_format=tf_saved_model --output_node_names="$NODES" --output_format=tfjs_graph_model --signature_name=serving_default "$SAVED_MODEL" "$TFJS_DIRECTORY"


echo "-- exporting model in  tflite format"
python3 "$TFLITE_EXPORT_SCRIPT"  --pipeline_config_path="$PIPELINE_CONFIG" --trained_checkpoint_dir="$TRAINING_DIRECTORY" --output_directory="$TFLITE_DIRECTORY"

tflite_convert --saved_model_dir="$SAVED_MODEL" --output_file="$SAVED_MODEL/model.tflite" --input_shapes=1,300,300,3 --input_arrays=normalized_input_image_tensor --output_arrays="$OUTPUTARRAYS" --inference_type=FLOAT --allow_custom_ops

