#!/bin/bash

set -euxo pipefail

# Install yay
# May need to exit nix shell
cd "$HOME/repos/yay/"
makepkg -si

# Install aur packages
yay google-cloud-cli
yay google-cloud-cli-gke-gcloud-auth-plugin
yay slack-desktop
yay spotify
yay zoom
yay dracula-gtk-theme
yay dracula-icons-git

# Also in nix
# yay autojump-rs
# yay tre-command
# yay vgrep

# Maybe
yay zramswap
