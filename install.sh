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
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo chmod 777 /var/run/docker.sock

# Install postgres and related tooling
# Do not forget, `sudo systemctl disable postgresql`
sudo apt-get install -y \
  postgresql-12 \
  pgcli

# Install py dev env
sudo apt-get install python-dev python3.9-dev python3.9-venv

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
  ctags \
  neovim

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
sudo apt-get install -y copyq preload unzip blueman htop xkbset screen pwgen

# Install autojump
sudo apt-get install -y \
  autojump \
  tree \
  xclip

# Install java and go md2man (for vgrep)
sudo apt-get install -y \
  default-jre \
  go-md2man

# Install obs studio for screencasting, vlc for viewing
sudo add-apt-repository ppa:obsproject/obs-studio && \
  sudo apt update && \
  sudo apt install -y ffmpeg obs-studio vlc

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

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
wget https://github.com/dandavison/delta/releases/download/0.14.0/git-delta_0.14.0_amd64.deb -O $HOME/Downloads/delta.deb
sudo dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

# Install sops
wget https://github.com/mozilla/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb -O $HOME/Downloads/sops.deb
sudo dpkg -i $HOME/Downloads/sops.deb
rm $HOME/Downloads/sops.deb
# Create directory for age keys
mkdir -p ~/.config/sops/age/

# Install go (dependency of vgrep)
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

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
sudo cp ./target/release/agg /usr/bin/
cd ../..

# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O $HOME/Downloads/dbeaver.deb
sudo dpkg -i $HOME/Downloads/dbeaver.deb
rm $HOME/Downloads/dbeaver.deb

# Install clickhouse client
wget https://repo.clickhouse.com/deb/stable/main/clickhouse-common-static_21.9.7.2_amd64.deb -O $HOME/Downloads/clk-cl.deb
sudo dpkg -i $HOME/Downloads/clk-cl.deb
rm $HOME/Downloads/clk-cl.deb
wget https://repo.clickhouse.com/deb/stable/main/clickhouse-client_21.9.7.2_all.deb -O $HOME/Downloads/clk-cmn.deb
sudo dpkg -i $HOME/Downloads/clk-cmn.deb
rm $HOME/Downloads/clk-cmn.deb

# Install age
wget https://github.com/FiloSottile/age/releases/download/v1.1.1/age-v1.1.1-linux-amd64.tar.gz -O $HOME/Downloads/age.tar.gz
sudo tar -C $HOME/Downloads/ -xzf $HOME/Downloads/age.tar.gz
sudo mv $HOME/Downloads/age/age /usr/bin/
sudo mv $HOME/Downloads/age/age-keygen /usr/bin/

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

# Install argo cli
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install kubelet, kubeadm
sudo apt-get install -y apt-transport-https ca-certificates
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get install -y kubeadm kubelet

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install pulumi, setup autocomplete
curl -fsSL https://get.pulumi.com | sh
mkdir "$HOME/.oh-my-zsh/custom/plugins/pulumi"
pulumi gen-completion zsh >> "$HOME/.oh-my-zsh/custom/plugins/pulumi/pulumi.plugin.zsh"

# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#######
# Other
#######

# Dbt autocomplete
mkdir ${HOME}/dbt-autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/_dbt > ${HOME}/dbt-autocomplete/_dbt
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ${HOME}/dbt-autocomplete/.dbt-completion.bash

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
vim --clean '+source ~/.vimrc' +PluginInstall +qall

##################
# Install crontabs
##################
crontab ./.crontab
