#!/bin/bash

set -euxo pipefail

git init
git remote add https https://github.com/rbetzler/dotfiles.git
git fetch --all
rm "$HOME/.bashrc"
git checkout arch

# Init, update submodules
git submodule update --init --recursive

# Install ansible
sudo pacman --sync --noconfirm ansible
ansible-galaxy collection install -r ~/.playbooks/requirements.yaml
