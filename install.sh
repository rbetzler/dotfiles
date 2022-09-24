#!/bin/bash

# Install zsh
apt-get install zsh -y

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Switch default shell to zsh
chsh -s $(which zsh)


## Install cli tools

# Install terminator
apt-get install terminator

# Install gnu awk
apt-get install gawk

# Install postgresl
# Do not forget, `sudo systemctl disable postgresql`
apt-get install postgresql-12

# Install py dev env
apt-get install python-dev

# Install filezilla
apt-get install filezilla

# Install nmap
apt-get install nmap

# Install traceroute
apt-get install traceroute

# Install vim-gtk
apt-get install vim-gtk -y

# Install ctags
apt-get install ctags

# Install cmatrix, for fun
apt-get install cmatrix

# Install figlet
apt-get install figlet

# Install fd
apt-get install fd-find -y

# Install fzf
apt-get install fzf -y

# Install jq
apt-get install jq -y

# Install neomutt
apt-get install neomutt

# Install isync
apt-get install isync

# Install asciinema
apt-get install asciinema

# Install chrome
apt-get install chromium-browser

# Install copyq
apt-get install copyq

# Install preload
apt-get install preload

# Install autojump
apt-get install autojump -y

# Install tree
apt-get install tree -y

# Install tree
apt-get install unzip -y

# Install htop for system performance
apt-get install htop -y

# Install bluetooth manager
apt-get install blueman

# Install psql alternative
apt-get install pgcli

# Install cli clipboard tool
apt-get install xclip

# Install java
apt-get install default-jre -y

# Install graphviz
apt-get install graphviz -y

# Install batcat (might need to upgrade manually, using a deb file)
apt-get install bat -y

# Install go md2man for vgrep
apt-get install go-md2man -y

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install gh

###########
# Git repos
###########

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Clone zsh syntax highlighting repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone zsh autocomplete repo
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh vi mode
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

# Clone jedi for vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

# Clone dracula color scheme for mutt
git clone https://github.com/dracula/mutt.git $HOME/dracula/mutt

# For terminator
git clone https://github.com/dracula/terminator.git $HOME/dracula/terminator

# For zsh (with symbolic link)
git clone https://github.com/dracula/zsh.git $HOME/dracula/zsh
ln -s $HOME/dracula/zsh/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme

# For zsh autcomplete
git clone https://github.com/dracula/zsh-syntax-highlighting.git $HOME/dracula/zsh-syntax

# For fzf autocomplete in zsh
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

################
# Cargo packages
################

# Install rustup for cargo for sd
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# Install sd
cargo install sd

# Install tree alternative
cargo install tre-command

############################
# Debian packages, tars, etc
############################

# Install exa
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O $HOME/Downloads/exa.zip
mkdir $HOME/Downloads/exa
unzip $HOME/Downloads/exa.zip -d $HOME/Downloads/exa
cp -r $HOME/Downloads/exa/bin/. /usr/local/bin/
cp -r Downloads/exa/man/. /usr/share/man/man1/
cp $HOME/Downloads/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/exa.zsh
rm -rf $HOME/Downloads/exa
rm $HOME/Downloads/exa.zip

# Install java manually, might need to fix dependencies
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.deb -O $HOME/Downloads/java.deb
dpkg -i $HOME/Downloads/java.deb
rm $HOME/Downloads/java.deb

# Install delta manually
wget https://github.com/dandavison/delta/releases/download/0.8.2/git-delta_0.8.2_amd64.deb -O $HOME/Downloads/delta.deb
dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

# Install go (dependency of vgrep)
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install vgrep
# Might need to back up a few commits, (given the head of master was busted in 2021-07)
git clone https://github.com/vrothberg/vgrep.git
cd vgrep
make build GO=/usr/local/go/bin/go
make install GO=/usr/local/go/bin/go
cd ..

# Dbeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O $HOME/Downloads/dbeaver.deb
dpkg -i $HOME/Downloads/dbeaver.deb
rm $HOME/Downloads/dbeaver.deb

# Install clickhouse client
wget https://repo.clickhouse.com/deb/stable/main/clickhouse-common-static_21.9.7.2_amd64.deb -O $HOME/Downloads/clk-cl.deb
dpkg -i $HOME/Downloads/clk-cl.deb
rm $HOME/Downloads/clk-cl.deb
wget https://repo.clickhouse.com/deb/stable/main/clickhouse-client_21.9.7.2_all.deb -O $HOME/Downloads/clk-cmn.deb
dpkg -i $HOME/Downloads/clk-cmn.deb
rm $HOME/Downloads/clk-cmn.deb

##############
# Devops tools
##############

# Install argo cli
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install pulumi, setup autocomplete
curl -fsSL https://get.pulumi.com | sh
pulumi gen-completion zsh >> "$HOME/.oh-my-zsh/custom/plugins/pulumi/pulumi.plugin.zsh"

#######
# Other
#######

# Dbt autocomplete
mkdir ${HOME}/dbt-autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/_dbt > ${HOME}/dbt-autocomplete/_dbt
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ${HOME}/dbt-autocomplete/.dbt-completion.bash

# Pull docker container for asci cinema
docker pull asciinema/asciicast2gif

#######################
# App installs, configs
#######################

# Install home python venv
bash ${HOME}/.python/install_venv

# Install vim plugins
vim --clean '+source ~/.vimrc' +PluginInstall +qall
