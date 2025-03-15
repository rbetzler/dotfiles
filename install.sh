#!/bin/bash

set -euxo pipefail

# Install dependencies
reqs="git zsh ansible"
for req in $reqs; do
  if grep -q Arch /etc/os-release; then
    sudo pacman --sync --noconfirm $req
  fi
done

# Clone dotfiles
curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/.playbooks/git.yaml -o /tmp/git.yaml
ansible-playbook /tmp/git.yaml

# Install ansible modules
ansible-galaxy collection install -r ~/.playbooks/requirements.yaml

# Install
# ansible-playbook ~/.playbooks/main.yaml
