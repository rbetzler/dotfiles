#!/bin/bash

set -euxo pipefail

reqs="git zsh"
for req in $reqs; do
  if which $req > /dev/null; then
    echo "$req installed"
  else
    echo "$req not installed, installing now"
    if grep -q Arch /etc/os-release; then
      sudo pacman --sync --noconfirm $req
    fi
  fi
done

git init
git remote add https https://github.com/rbetzler/dotfiles.git
git fetch --all
rm "$HOME/.bashrc"
git checkout arch

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Init, update submodules
git submodule update --init --recursive

# Install ansible
sudo pacman --sync --noconfirm ansible
ansible-galaxy collection install -r ~/.playbooks/requirements.yaml
