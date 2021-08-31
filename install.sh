#!/bin/bash

# Install zsh
apt-get install zsh

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Switch default shell to zsh
chsh -s $(which zsh)


## Install cli tools

# Install terminator
apt-get install terminator

# Install vim-gtk
apt-get install vim-gtk

# Install ctags
apt-get install ctags

# Install cmatrix, for fun
apt-get install cmatrix

# Install figlet
apt-get install figlet

# Install fd
apt-get install fd-find

# Install fzf
apt-get install fzf

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

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Clone zsh syntax highlighting repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Clone zsh autocomplete repo
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh vi mode
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode

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

# Install dbt autocomplete
mkdir ${HOME}/dbt-autocomplete
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/_dbt > ${HOME}/dbt-autocomplete/_dbt
curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ${HOME}/dbt-autocomplete/.dbt-completion.bash

# Install rustup for cargo for sd
curl https://sh.rustup.rs -sSf | sh

# Install sd
cargo install sd

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install gh

# If arm, i.e., pi
if uname -m | grep --quiet 'arm' ; then

  echo "Download exa via apt get"
  apt-get install exa

  # Delta install succeeds but does not work
  # apt-get install delta

  echo "Setting download urls for arm, i.e., pi"
  DELTA="https://github.com/dandavison/delta/releases/download/0.8.3/git-delta_0.8.3_armhf.deb"
  GO="https://golang.org/dl/go1.17.linux-armv6l.tar.gz"

  wget https://github.com/sharkdp/bat/releases/download/v0.18.2/bat_0.18.2_armhf.deb -O $HOME/Downloads/bat.deb
  dpkg -i $HOME/Downloads/bat.deb
  rm $HOME/Downloads/bat.deb

# Otherwise, ubuntu
else

  # Install batcat
  apt-get install bat

  echo "Download exa, delta manually"
  # Install exa
  wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O $HOME/Downloads/exa.zip
  mkdir $HOME/Downloads/exa
  unzip $HOME/Downloads/exa.zip -d $HOME/Downloads/exa
  cp -r $HOME/Downloads/exa/bin/. /usr/local/bin/
  cp -r Downloads/exa/man/. /usr/share/man/man1/
  cp $HOME/Downloads/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/exa.zsh
  rm -rf $HOME/Downloads/exa
  rm $HOME/Downloads/exa.zip

  echo "Pull docker image to convert cast file to gif"
  docker pull asciinema/asciicast2gif

  echo "Setting download urls for amd, i.e., ubuntu"
  DELTA="https://github.com/dandavison/delta/releases/download/0.8.2/git-delta_0.8.2_amd64.deb"
  GO="https://golang.org/dl/go1.16.5.linux-amd64.tar.gz"

fi

# Install delta manually
wget $DELTA -O $HOME/Downloads/delta.deb
dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

# Install go (dependency of vgrep)
wget $GO -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install go md2man for vgrep
apt-get install go-md2man

# Install vgrep
# Might need to back up a few commits
# (given the head of master was busted in 2021-07)
git clone git@github.com:vrothberg/vgrep.git
cd vgrep
make build GO=/usr/local/go/bin/go
make install GO=/usr/local/go/bin/go

# Install vivaldi
wget https://downloads.vivaldi.com/stable/vivaldi-stable_4.1.2369.21-1_amd64.deb -O $HOME/Downloads/vivaldi.deb
dpkg -i $HOME/Downloads/vivaldi.deb
rm $HOME/Downloads/vivaldi.deb

# Install home python venv
bash ${HOME}/.python/install_venv
