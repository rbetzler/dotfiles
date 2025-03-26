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

# Make an empty python venv because ansible expects it via `ansible_python_interpreter`
python3 -m venv ~/venv
