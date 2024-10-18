#!/bin/bash

set -euxo pipefail

git init
git remote add https https://github.com/rbetzler/dotfiles.git
git fetch --all
rm "$HOME/.bashrc"
git checkout arch

# Init, update submodules
git submodule update --init --recursive
