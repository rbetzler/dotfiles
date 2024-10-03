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

# Switch default shell to zsh
chsh -s "$(which zsh)"

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Nix multi user install
sh <(curl -L https://nixos.org/nix/install) --daemon

# Install nix shell caching
nix-env -iA nixpkgs.cached-nix-shell

# Init, update submodules
git submodule update --init --recursive

# Symbolic link for zsh theme
ln -s "${HOME}/dracula/zsh/dracula.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/dracula.zsh-theme"

# Install vim plug for neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install git lfs
curl -LO https://github.com/git-lfs/git-lfs/releases/download/v3.4.1/git-lfs-linux-amd64-v3.4.1.tar.gz
tar -xf git-lfs-linux-amd64-v3.4.1.tar.gz
sudo bash git-lfs-3.4.1/install.sh

# Install zen browser
wget https://github.com/zen-browser/desktop/releases/download/1.0.0-a.39/zen.linux-specific.tar.bz2 -O "${HOME}/Downloads/zen.tar.bz2"
tar xjf "${HOME}/Downloads/zen.tar.bz2"
sudo mv zen /opt/
# Grab desktop icon manually
curl https://cdn.jsdelivr.net/gh/zen-browser/www/public/logos/zen-black.svg | sudo tee /usr/share/icons/zen-black.svg

# Install home python venv
cached-nix-shell --command '${HOME}/.bin/install_venv.sh'

#######################
# Install autocompletes
#######################

# Pulumi
mkdir "${HOME}/.oh-my-zsh/custom/plugins/pulumi"
cached-nix-shell --command 'pulumi gen-completion zsh >> "${HOME}/.oh-my-zsh/custom/plugins/pulumi/pulumi.plugin.zsh"'

# Argo
cached-nix-shell --command 'argo completion zsh > "${HOME}/.utils/argo.sh"'
sed -i '1i compdef _argo argo' "${HOME}/.utils/argo.sh"

# Argo CD
cached-nix-shell --command 'argocd completion zsh > "${HOME}/.utils/argocd.sh"'

# Kubectl
cached-nix-shell --command 'kubectl completion zsh > "${HOME}/.utils/kubectl.sh"'

# Helm
cached-nix-shell --command 'helm completion zsh > "${HOME}/.utils/helm.sh"'

#####
# AUR
#####

# Install yay
# May need to exit nix shell
cd ~/repos/yay/
makepkg -si

# Install aur packages
yay google-cloud-cli
yay google-cloud-cli-gke-gcloud-auth-plugin
yay slack-desktop
yay spotify
# See notes on install
yay zoom

# Also in nix
# yay autojump-rs
# yay tre-command
# yay vgrep

# Maybe
yay zramswap

# Generate autojump autocompletes, depending on how installed
mkdir "${HOME}/.local/share/autojump/"
# cat "$(which autojump | cut -d/ -f1-2)/share/autojump/autojump.zsh" > "${HOME}/.local/share/autojump/autojump.zsh"
cached-nix-shell --command 'cat "$(which autojump | cut -d/ -f1-4)/share/autojump/autojump.zsh" > "${HOME}/.local/share/autojump/autojump.zsh"'
