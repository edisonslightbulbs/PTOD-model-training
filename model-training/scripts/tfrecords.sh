#!/bin/bash

# tfrecords.sh
#   Creates TF records using image annotations
#
# author: Everett
# created: 2021-08-27 06:15
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

ANNOTATIONS="$wd/annotations/annotations.pbtxt"
TF_RECORDS_SCRIPT="$wd/scripts/tfrecords.py"

TESTING_IMAGES_DIRECTORY="$wd/resources/images/test"
TRAINING_IMAGES_DIRECTORY="$wd/resources/images/train"

TESTING_RECORD="$wd/records/test.record"
TRAINING_RECORD="$wd/records/train.record"

# clean old records
rm -rf "$wd/records/*.record"  >/dev/null 2>&1
echo "-- creating TensorFlow records using image annotations"

python3 "$TF_RECORDS_SCRIPT" -x "$TRAINING_IMAGES_DIRECTORY" -l "$ANNOTATIONS" -o "$TRAINING_RECORD"
python3 "$TF_RECORDS_SCRIPT" -x "$TESTING_IMAGES_DIRECTORY" -l "$ANNOTATIONS"  -o "$TESTING_RECORD"
