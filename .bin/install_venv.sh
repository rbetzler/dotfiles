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
# export PYENV_ROOT="$HOME/repos/pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# pyenv exec python3.10 -m venv venv
python3 -m venv venv

echo 'Activating venv'
source ./venv/bin/activate

uv pip install -r ./requirements.txt
