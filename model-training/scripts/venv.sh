#!/bin/bash

# venv.sh
#   Sets up a virtual environment with ipykernel
#
# author: Everett
# created: 2021-08-27 06:22
# Github: https://github.com/antiqueeverett/

# evaluate working directory
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    wd="$(dirname "$(dirname "$(readlink -f "$0")")")"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    wd="$(dirname "$(dirname "$(greadlink -f "$0")")")"
fi

# change to working directory
cd "$wd" || return

venv="venv"
if [ $# -eq 0 ]; then
    echo "-- no arguments were provided"
    echo "-- using $venv as the name for your virtual environment"
    echo "-- installing virtual environment"
else
    if checkargs "$@"; then
    echo "-- installing $1 virtual environment"
    fi
fi

# create iff non exists
if [ -d "$venv" ]; then
    echo "-- found $venv (seems like one was already created)"
else
    if python3 -m venv "$venv"; then
        source "$venv/bin/activate"
        python3 -m pip install --upgrade pip
        "$wd/scripts/dependencies.sh"
        python3 -m ipykernel install --user --name="$venv"
    else
        echo "-- failed to correctly create virtual environment"
    fi
fi
