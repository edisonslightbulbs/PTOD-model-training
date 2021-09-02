#!/usr/bin/env bash

# build_K4a_SDK.sh:
#     Build the Azure-Kinect-Sensor-SDK submodule project
#     cmake project using with -GNinja.
#
# author: Everett
# created: 2020-11-06 13:41
# Github: https://github.com/antiqueeverett/

PROJECT_DIRECTORY="$(dirname "$(dirname "$(readlink -f "$0")")")"
echo "-- building Azure-Kinect-Sensor-SDK from: $PROJECT_DIR"

# -- build directory
build="$PROJECT_DIRECTORY/external/Azure-Kinect-Sensor-SDK/build"

# -- make sure to clear any old build files
if [ -d "$build" ]; then rm -Rf "$build"; fi

# -- build with CMake -GNinja
mkdir "$build" && cd "$build" || return
cmake .. -GNinja
ninja
cd - || return
