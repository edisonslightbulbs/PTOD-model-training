#!/bin/bash

# pretrained-model.sh
#   Downloads pretrained model from the TF model zoo and un-archives it
#
# author: Everett
# created: 2021-08-27 06:02
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

model="ssd_mobilenet_v2_fpnlite_320x320_coco17_tpu-8.tar.gz"
url="http://download.tensorflow.org/models/object_detection/tf2/20200711/$model"

cd "$wd/models/pretrained" || true

echo "-- downloading $model from $url"
wget "$url"
tar -zxvf "$model"
