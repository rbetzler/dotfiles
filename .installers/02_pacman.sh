#!/bin/bash

# Install global requirements
sudo pacman --sync --noconfirm \
  zsh \
  terminator \
  git \
  wget

# Install aesthetic helpers
sudo pacman --sync --noconfirm \
  nerd-fonts \
  gnome-tweaks \
  gnome-themes-extra \

# Install audio
sudo pacman --sync --noconfirm \
  pipewire \
  pipewire-alsa \
  pipewire-audio \
  pipewire-pulse \
  sof-firmware

# Install xorg (for zoom mainly)
sudo pacman --sync --noconfirm xorg-server

# Install, enable bluetooth
sudo pacman --sync --noconfirm \
  bluez \
  bluez-utils
sudo systemctl enable bluetooth.service

# Install global cli tools
# Also in nix
# sudo pacman --sync --noconfirm \
#   bat \
#   eza \
#   fd \
#   fzf \
#   gawk \
#   git-delta \
#   jq \
#   pyenv \
#   sd

# Install other apps
sudo pacman --sync --noconfirm \
  copyq \
  dbeaver \
  direnv \
  libreoffice-still \
  tree \
  xclip

# Install docker
sudo pacman --sync --noconfirm \
  docker \
  docker-buildx
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
