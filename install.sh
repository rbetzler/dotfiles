#!/bin/bash

# Install zsh
sudo apt-get install zsh -y

# Switch default shell to zsh
chsh -s $(which zsh)

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

########################
# Debian package manager
########################

# Install terminator
sudo apt-get install terminator

# Placeholder for docker, docker-compose
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo chmod 777 /var/run/docker.sock

# Install postgres and related tooling
# Do not forget, `sudo systemctl disable postgresql`
sudo apt-get install -y \
  postgresql-14 \
  pgcli

# Install py dev env
sudo apt-get install python3.10-dev python3.10-venv python3-dev python3-pip

# Install pyenv dependencies
sudo apt-get install -y build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev python-tk python3-tk tk-dev

# Install filezilla
sudo apt-get install filezilla

# Install networking stuff
sudo apt-get install -y \
  nmap \
  traceroute \
  wireshark

# Install vim stuff
sudo apt-get install -y \
  vim-gtk \
  ctags

# Install cmatrix, for fun
sudo apt-get install \
  cmatrix \
  figlet \
  graphviz

# Install improved cli tools
sudo apt-get install -y \
  fd-find \
  jq \
  gawk

# Debian packages were older
curl -LO https://github.com/junegunn/fzf/releases/download/0.35.0/fzf-0.35.0-linux_amd64.tar.gz
tar -zxvf fzf-0.35.0-linux_amd64.tar.gz
rm fzf-0.35.0-linux_amd64.tar.gz
sudo mv fzf /usr/local/bin/

# Install mail tooling
sudo apt-get install -y neomutt isync

# Install asciinema
sudo apt-get install asciinema

# Install chrome
sudo apt-get install chromium-browser

# Install miscellaneous
sudo apt-get install -y copyq preload unzip blueman htop xkbset screen pwgen sqlite3 mysql-client cpulimit tmux

# Install redis
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install redis

# Install autojump
sudo apt-get install -y \
  autojump \
  tree \
  xclip

# Install java and go md2man (for vgrep)
sudo apt-get install -y \
  default-jre \
  go-md2man

# Install neovim dependencies
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - && \
  sudo apt-get install -y nodejs

# Install obs studio for screencasting, vlc for viewing
sudo add-apt-repository ppa:obsproject/obs-studio && \
  sudo apt update && \
  sudo apt install -y ffmpeg obs-studio vlc

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Install gnome extensions (for window manager)
sudo apt-get -y install \
  gnome-shell-extensions\
  chrome-gnome-shell
wget https://github.com/Fmstrat/wintile/releases/download/v7/wintile@nowsci.com.zip -O $HOME/Downloads/wintile@nowsci.com.zip
mkdir -p ~/.local/share/gnome-shell/extensions/
unzip $HOME/Downloads/wintile@nowsci.com.zip -d .local/share/gnome-shell/extensions/wintile@nowsci.com/

# Add spotfiy install
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

##########################
# Git repos via submodules
##########################

# Init, update submodules
git submodule update --init --recursive

# Symbolic link for zsh theme
ln -s $HOME/dracula/zsh/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme

################
# Cargo packages
################

# Requirement for rust
sudo apt-get install -y build-essential

# Install rustup for cargo for sd
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# Install sd
cargo install sd

# Install tree alternative
cargo install tre-command

############################
# Debian files, tars, etc
############################

# Install neovim, twice
# TODO Fix this install, build from source
sudo apt-get install -y neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz -O $HOME/Downloads/nvim.tar.gz
tar -C $HOME/Downloads/ -xzvf $HOME/Downloads/nvim.tar.gz
sudo mv $HOME/Downloads/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Install exa
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O $HOME/Downloads/exa.zip
mkdir $HOME/Downloads/exa
unzip $HOME/Downloads/exa.zip -d $HOME/Downloads/exa
sudo cp -r $HOME/Downloads/exa/bin/. /usr/local/bin/
sudo cp -r Downloads/exa/man/. /usr/share/man/man1/
sudo cp $HOME/Downloads/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/exa.zsh
rm -rf $HOME/Downloads/exa
rm $HOME/Downloads/exa.zip

# Install bat manually
curl -LO https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb
sudo dpkg -i bat_0.22.1_amd64.deb
rm bat_0.22.1_amd64.deb

# Install java manually, might need to fix dependencies
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb -O $HOME/Downloads/java.deb
sudo dpkg -i $HOME/Downloads/java.deb
rm $HOME/Downloads/java.deb

# Install delta manually
wget https://github.com/dandavison/delta/releases/download/0.16.5/git-delta_0.16.5_amd64.deb -O $HOME/Downloads/delta.deb
sudo dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

# Install sops
wget https://github.com/mozilla/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb -O $HOME/Downloads/sops.deb
sudo dpkg -i $HOME/Downloads/sops.deb
rm $HOME/Downloads/sops.deb
# Create directory for age keys
mkdir -p ~/.config/sops/age/

# Install go (dependency of vgrep)
wget https://golang.org/dl/go1.20.3.linux-amd64.tar.gz -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install drawio manually
wget https://github.com/jgraph/drawio-desktop/releases/download/v22.0.2/drawio-amd64-22.0.2.deb -O $HOME/Downloads/drawio.deb
sudo dpkg -i $HOME/Downloads/drawio.deb
rm $HOME/Downloads/drawio.deb

# Build vgrep
# Repo is cloned via submodules
# Might need to back up a few commits, (given the head of master was busted in 2021-07)
cd repos/vgrep
make build GO=/usr/local/go/bin/go
sudo make install GO=/usr/local/go/bin/go
cd ../..

# Build binaries for asciinema
# Repo is cloned via submodules
cd repos/agg
cargo build -r
sudo cp ./target/release/agg /usr/local/bin/
cd ../..

# Build, install grex
cd repos/grex
cargo build
sudo cp ./target/debug/grex /usr/local/bin/
cd ../..

# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O $HOME/Downloads/dbeaver.deb
sudo dpkg -i $HOME/Downloads/dbeaver.deb
rm $HOME/Downloads/dbeaver.deb

# Install clickhouse client
wget https://github.com/ClickHouse/ClickHouse/releases/download/v24.4.3.25-stable/clickhouse-common-static_24.4.3.25_amd64.deb -O $HOME/Downloads/clk-cl.deb
sudo dpkg -i $HOME/Downloads/clk-cl.deb
rm $HOME/Downloads/clk-cl.deb
wget https://github.com/ClickHouse/ClickHouse/releases/download/v24.4.3.25-stable/clickhouse-client_24.4.3.25_amd64.deb -O $HOME/Downloads/clk-cmn.deb
sudo dpkg -i $HOME/Downloads/clk-cmn.deb
rm $HOME/Downloads/clk-cmn.deb

# Install age
wget https://github.com/FiloSottile/age/releases/download/v1.1.1/age-v1.1.1-linux-amd64.tar.gz -O $HOME/Downloads/age.tar.gz
sudo tar -C $HOME/Downloads/ -xzf $HOME/Downloads/age.tar.gz
sudo mv $HOME/Downloads/age/age /usr/local/bin/
sudo mv $HOME/Downloads/age/age-keygen /usr/local/bin/

# Install obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.15/obsidian_1.1.15_amd64.deb -O $HOME/Downloads/obsidian.deb
sudo dpkg -i $HOME/Downloads/obsidian.deb
rm $HOME/Downloads/obsidian.deb

# Install pandoc
wget https://github.com/jgm/pandoc/releases/download/3.1/pandoc-3.1-1-amd64.deb -O $HOME/Downloads/pandoc.deb
sudo dpkg -i $HOME/Downloads/pandoc.deb
rm $HOME/Downloads/pandoc.deb

##############
# Devops tools
##############

# Install argo cd cli
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
argocd completion zsh > $HOME/.utils/argocd.sh
sed -i '1i compdef _argocd argocd' $HOME/.utils/argocd.sh

# Install argo workflows cli
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/v3.4.5/argo-linux-amd64.gz -o $HOME/Downloads/argo.gz
gunzip $HOME/Downloads/argo.gz
chmod +x $HOME/Downloads/argo
mv $HOME/Downloads/argo /usr/local/bin/argo
argo completion zsh > $HOME/.utils/argo.sh
# https://github.com/argoproj/argo-cd/issues/10534
sed -i '1i compdef _argo argo' $HOME/.utils/argo.sh

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl completion zsh > $HOME/.utils/kubectl.sh

# Install kubelet, kubeadm
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm kubelet

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm completion zsh > $HOME/.utils/helm.sh

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Kubeseal for sealed secrets
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.20.2/kubeseal-0.20.2-linux-amd64.tar.gz
tar -xvzf kubeseal-0.20.2-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

# Install pulumi, setup autocomplete
curl -fsSL https://get.pulumi.com | sh
mkdir "$HOME/.oh-my-zsh/custom/plugins/pulumi"
pulumi gen-completion zsh >> "$HOME/.oh-my-zsh/custom/plugins/pulumi/pulumi.plugin.zsh"

# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install vim plug for neovim plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install neovim dependencies
sudo npm install --global yarn

# Install hugo
go install -tags extended github.com/gohugoio/hugo@latest
hugo completion zsh > $HOME/.utils/hugo.sh
sed -i '1i compdef _hugo hugo' $HOME/.utils/hugo.sh

# Install vault cli
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vault

#######
# Other
#######

# Budibase cli
mkdir $HOME/.budi
wget https://github.com/Budibase/budibase/releases/latest/download/cli-linux -O $HOME/.budi/budi
chmod +x $HOME/.budi/budi

#######################
# App installs, configs
#######################

# Install home python venv
bash ${HOME}/.bin/install_venv.sh

# Install vim plugins
# TODO: Fix this, since it doesn't work
nvim --clean '+source ~/.config/nvim/init.vim' +PlugInstall +qall

# Install duckdb cli
wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip -O $HOME/Downloads/duckdb.zip
sudo unzip $HOME/Downloads/duckdb.zip -d /usr/local/bin/

# Install git lfs
curl -LO https://github.com/git-lfs/git-lfs/releases/download/v3.4.1/git-lfs-linux-amd64-v3.4.1.tar.gz
tar -xf git-lfs-linux-amd64-v3.4.1.tar.gz
sudo bash git-lfs-3.4.1/install.sh

##################
# Install crontabs
##################
crontab ./.crontab
