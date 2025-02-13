#!/bin/bash

set -euxo pipefail

if which git > /dev/null; then
  echo 'Git installed'
else
  echo 'Git not installed, installing now'
  if grep -q Arch /etc/os-release; then
    sudo pacman --sync --noconfirm git
  fi
fi

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
