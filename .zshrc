
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="dracula"
# DRACULA_DISPLAY_CONTEXT=1  # print username too

plugins=(
  aws
  docker
  docker-compose
  fzf-tab
  gcloud
  kubectl
  minikube
  nix-zsh-completions
  pulumi
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-system-clipboard
  zsh-vi-mode
)

# Initialize vi mode early
ZVM_INIT_MODE=sourcing

# Set neovim as default editor
export EDITOR="nvim"

source $ZSH/oh-my-zsh.sh

source $HOME/dracula/zsh-syntax/zsh-syntax-highlighting.sh

source /usr/share/autojump/autojump.zsh

# source all shell files
DIRS=(creds utils work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    if [[ "${f: -3}" == ".sh" ]]; then
      source $f;
    fi
  done
done

# activate home python venv
source ${HOME}/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

# Pulumi path
export PATH=$PATH:$HOME/.pulumi/bin

# Go path
export PATH=$PATH:/usr/local/go/bin

# Go executables
export PATH=$PATH:$HOME/go/bin

# Budibase path
export PATH=$PATH:$HOME/.budi/

# Support for `docker-compose` command
export PATH=$PATH:$HOME/.docker/cli-plugins/

# Support for spark
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# Path for neovim
export PATH=$PATH:/opt/nvim/bin

# Use ipdb when python comes across breakpoint()
# in a file
export PYTHONBREAKPOINT=ipdb.set_trace

# Zsh vi mode cursor configs
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# Key binds to override zsh vi mode
zvm_bindkey viins "^[[H" beginning-of-line
zvm_bindkey viins "^[[F" end-of-line

# Shortcut to copy entire zsh register into clipboard
bindkey -M vicmd 'yy' zsh-system-clipboard-vicmd-vi-yank-whole-line

# Patch slow git autosuggestions
# https://stackoverflow.com/questions/9810327/zsh-auto-completion-for-git-takes-significant-amount-of-time-can-i-turn-it-off/9810485#9810485
__git_files () {
    _wanted files expl 'local files' _files
}

# Patch inconsistent bat, batcat naming
if ! type bat &>/dev/null ; then
  alias bat="batcat"
fi

# Use bat/batcat when running `man <package>`
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# For airbyte dev in java
export JAVA_HOME=/usr/lib/jvm/default-java/

# Do not remove slash from dir
# https://unix.stackexchange.com/questions/160026/how-can-i-keep-the-trailing-slash-after-choosing-a-directory-from-the-zsh-comple
setopt no_auto_remove_slash

# Set dracula colors for fzf default, since not everything used this scheme
export FZF_DEFAULT_OPTS='
  --color fg:255,hl:84,fg+:255,bg+:236,hl+:215
  --color info:141,prompt:84,spinner:212,pointer:212,marker:212
'

# Pyenv config
# export PYENV_ROOT="$HOME/repos/pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Aws prompt format
# ZSH_THEME_AWS_PROFILE_SUFFIX=""
# ZSH_THEME_AWS_REGION_PREFIX=""

# Cannot toggle delta configs if they are in ~/.gitconfig
export DELTA_FEATURES=+side-by-side

# Show if in nix shell
prompt_nix_shell_setup

# Activate nix zsh shim
source $ZSH_CUSTOM/plugins/zsh-nix-shell/nix-shell.plugin.zsh

# Activate direnv if installed
if ! command -v direnv &> /dev/null; then
else
  eval "$(direnv hook zsh)"
fi

# https://stackoverflow.com/questions/3160909/how-do-i-deal-with-certificates-using-curl-while-trying-to-access-an-https-url
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Most aliases
alias b="bat --theme Dracula"
alias c="bat --theme Dracula"
alias ch="clickhouse-client --vertical"
alias cpcstdin="xclip -selection clipboard"
alias cpc-stdin="xclip -selection clipboard"
alias dk="docker"
alias fd="fdfind"
alias g="git"
alias ggrep="git grep"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias ipy="ipython"
alias ipyspark="PYSPARK_DRIVER_PYTHON=ipython pyspark"
alias jc="python -m jc"
alias pg="pgcli"
alias pu="pulumi"
alias s="sync_current_mailbox"
alias t="pwd && tre -e"
alias v="nvim"
alias vp="nvim -p"
