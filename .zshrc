
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="dracula"
DRACULA_DISPLAY_CONTEXT=1  # print username too

plugins=(
  aws
  docker
  docker-compose
  fzf-tab
  kubectl
  minikube
  pulumi
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
  zsh-vi-mode
)

# dbt autocomplete
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source ~/dbt-autocomplete/.dbt-completion.bash
fpath=(~/dbt-autocomplete/_dbt $fpath)

source $ZSH/oh-my-zsh.sh

source $HOME/dracula/zsh-syntax/zsh-syntax-highlighting.sh

source /usr/share/autojump/autojump.zsh

# source every non-readme file in the following dirs
# which contain creds, configs, scripts
DIRS=(creds_db creds_dbt creds_mutt general work)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    if [ "${f: -3}" != ".md" ] && [ "${f: -5}" != ".json" ] && [ "${f: -7}" != ".ignore" ] && [ "${f: -4}" != ".yml" ] && [ "${f: -3}" != ".py" ]; then
      source $f;
    fi
  done
done

# activate home python venv
source ${HOME}/.python/venv/bin/activate

# ipython env
export IPYTHONDIR="$HOME"/.ipython

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
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# For airbyte dev in java
export JAVA_HOME=/usr/lib/jvm/jdk-17/

# Do not remove slash from dir
# https://unix.stackexchange.com/questions/160026/how-can-i-keep-the-trailing-slash-after-choosing-a-directory-from-the-zsh-comple
setopt no_auto_remove_slash

# Set dracula colors for fzf default, since not everything used this scheme
export FZF_DEFAULT_OPTS='
  --color fg:255,hl:84,fg+:255,bg+:236,hl+:215
  --color info:141,prompt:84,spinner:212,pointer:212,marker:212
'

# Most aliases
# Mutt aliases exist in .general/mutt
alias b="bat"
alias c="bat"
alias ch="clickhouse-client --vertical"
alias dk="docker"
alias fd="fdfind"
alias g="git"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias ipy="ipython"
alias pg="pgcli"
alias s="sync_current_mailbox"
alias t="pwd && tre -e"
alias v="vim"
alias vp="vim -p"
