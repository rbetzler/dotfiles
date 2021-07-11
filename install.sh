#!/bin/bash

# Install zsh
apt-get install zsh

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Switch default shell to zsh
chsh -s $(which zsh)

# Install vim-gtk
apt-get install vim-gtk

# Install ctags
apt-get install ctags

# Install hub
apt-get install hub  # Still need to sort this out

# Install cmatrix, for fun
apt-get install cmatrix

# Install figlet
apt-get install figlet

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Install dbt autocomplete
mkdir ${HOME}/dbt-autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/_dbt > ${HOME}/dbt-autocomplete/_dbt
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ${HOME}/dbt-autocomplete/.dbt-completion.bash

# Install home python venv
sh ${HOME}/.python/install_venv

# CLone zsh syntax highlighting repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone zsh autocomplete repo
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.1/bat-musl_0.18.1_amd64.deb -O $HOME/Downloads/bat.deb
dpkg -i $HOME/Downloads/bat.deb
rm $HOME/Downloads/bat.deb

# Install exa
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O $HOME/Downloads/exa.zip
mkdir $HOME/Downloads/exa
unzip $HOME/Downloads/exa.zip -d $HOME/Downloads/exa
cp -r $HOME/Downloads/exa/bin/. /usr/local/bin/
cp -r Downloads/exa/man/. /usr/share/man/man1/
cp $HOME/Downloads/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/exa.zsh
rm -rf $HOME/Downloads/exa
rm $HOME/Downloads/exa.zip

# Install go (dependency of vgrep)
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install vgrep
# Might need to back up a few commits
# (given the head of master was busted in 2021-07)
git clone git@github.com:vrothberg/vgrep.git
cd vgrep
make build GO=/usr/local/go/bin/go
make install GO=/usr/local/go/bin/go
