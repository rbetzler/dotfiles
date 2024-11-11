#!/bin/bash

set -euxo pipefail

# Nix install
# Likely need to reboot
sudo pacman -Sy nix
sudo gpasswd -a $USER nix-users
sudo systemctl enable nix-daemon.service
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# Install nix shell caching
nix-env -iA nixpkgs.cached-nix-shell

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

# Generate autojump autocompletes, depending on how installed
mkdir "${HOME}/.local/share/autojump/"
# cat "$(which autojump | cut -d/ -f1-2)/share/autojump/autojump.zsh" > "${HOME}/.local/share/autojump/autojump.zsh"
cached-nix-shell --command 'cat "$(which autojump | cut -d/ -f1-4)/share/autojump/autojump.zsh" > "${HOME}/.local/share/autojump/autojump.zsh"'
