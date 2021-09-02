#!/usr/bin/env bash

# execute_3dintact.sh:
#   executes toolkit
#
# author: Everett
# created: 2021-04-15 18:59
# Github: https://github.com/antiqueeverett/

PROJECT_DIRECTORY="$(dirname "$(dirname "$(readlink -f "$0")")")"
echo "-- executing project"

# -- BIN directory
cd "$PROJECT_DIRECTORY" || return

mkdir -p ./output
rm -rf ./output/captured/*.png
./build/bin/capture --logtostderr=1
