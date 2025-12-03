#!/bin/bash

set -euxo pipefail

# Install dependencies
if grep -q Arch /etc/os-release; then
  sudo pacman --sync --noconfirm git zsh ansible
elif grep -q Ubuntu /etc/os-release; then
  # Dependencies for ansible
  sudo apt update
  sudo apt install --yes software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install --yes git zsh ansible python3.12-venv

  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Clone dotfiles
curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/.playbooks/common/git_init.yaml -o /tmp/git.yaml
ansible-playbook /tmp/git.yaml

# Install ansible modules
ansible-galaxy collection install -r ~/.playbooks/requirements.yaml

# Make an empty python venv because ansible expects it via `ansible_python_interpreter`
python3 -m venv ~/venv
