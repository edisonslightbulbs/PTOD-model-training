#!/bin/bash

# check-submodules.sh
#   Checks required submodule repositories
#
# author: Everett
# created: 2021-08-26 11:34
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

# make sure submodules are initialized
ANNOTATION_TOOL="$wd/external/labelImg"
TENSORFLOW_MODELS="$wd/external/models"

echo "-- checking submodules"

# Initialize iff submodule dir empty
if [ -z "$(ls -A "$ANNOTATION_TOOL")" ]; then
    command git pull --recurse-submodules -j 12
    command git submodule update --init --recursive -j 12
fi

# Initialize iff submodule dir empty
if [ -z "$(ls -A "$TENSORFLOW_MODELS")" ]; then
    command git pull --recurse-submodules -j 12
    command git submodule update --init --recursive -j 12
fi
