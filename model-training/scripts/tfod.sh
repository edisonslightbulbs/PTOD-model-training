#!/bin/bash

# tfod.sh
#   Install TF object detection and verifies installation
#
# author: Everett
# created: 2021-08-27 06:04
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

# setup object detection module
PROTOCOL_BUFFERS="./object_detection/protos"
TENSORFLOW_RESEARCH="$wd/external/models/research"
PACKAGE_SETUP_SCRIPT="./object_detection/packages/tf2/setup.py"
VERIFICATION_SCRIPT="./object_detection/builders/model_builder_tf2_test.py"

cd "$TENSORFLOW_RESEARCH" || true
protoc "$PROTOCOL_BUFFERS/"*.proto --python_out=.
cp "$PACKAGE_SETUP_SCRIPT" ./
python3 -m pip install .
python3 "$VERIFICATION_SCRIPT"
