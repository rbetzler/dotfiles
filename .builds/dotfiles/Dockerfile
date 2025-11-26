FROM ubuntu:focal

WORKDIR /root

# Make a directory where deb packages will go
RUN mkdir /root/Downloads

# Install tooling that may or may not exist in the image
RUN apt-get update
RUN apt-get install git curl wget sudo python3.8-venv build-essential -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# Clone this repo into the container
RUN git init && \
  git remote add origin https://github.com/rbetzler/dotfiles.git && \
  git pull origin master

# Install the actual packages
RUN bash ./install.sh skip_arg

# Zsh install overwrites zshrc, undo that
RUN git checkout .

ENTRYPOINT ["/usr/bin/zsh"]
