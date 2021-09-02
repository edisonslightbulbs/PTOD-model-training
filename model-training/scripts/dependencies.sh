#!/bin/bash

# dependencies.sh
#   Installs essential apt and pip packages
#
# author: Everett
# created: 2021-08-27 05:58
# Github: https://github.com/antiqueeverett/

# evaluate working directory
wd="$(dirname "$(dirname "$(readlink -f "$0")")")"

# setup vars for apt and pip package lists
apt="$wd/resources/apt.txt"
pip="$wd/resources/pip.txt"

echo "-- installing apt packages:"
cat "$apt"
echo ""

echo "-- installing pip packages:"
cat "$pip"
echo ""

# use awk to pre-process each line (i.e., in apt.txt & pip.txt)
# then, hand over each line-output to xargs (approach leaves STDIN unchanged!)
# args:
#      [ -a ] leave STDIN unchanged while reading each line as a  command
#      [ -r ] run iff line not empty
xargs -a <(awk '! /^ *(#|$)/' "$apt") -r -- sudo apt install
xargs -a <(awk '! /^ *(#|$)/' "$pip") -r -- pip3 install --upgrade
