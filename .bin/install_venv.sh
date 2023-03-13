#!/bin/bash

set -eu

echo 'Creating home py venv'

cd $HOME
echo $(pwd)

if [ -d venv ]; then
  echo 'Removing existing venv dir'
  rm -r venv
fi

echo 'Creating venv'
python3.9 -m venv venv

echo 'Activating venv'
source ./venv/bin/activate

echo 'Installing packages'
pip3 install --upgrade pip
pip3 install -r ./requirements.txt