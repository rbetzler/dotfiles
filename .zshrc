
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="dracula"
# DRACULA_DISPLAY_CONTEXT=1  # print username too

plugins=(
  aws
  direnv
  docker
  docker-compose
  fzf-tab
  gcloud
  kubectl
  minikube
  mise
  nix-zsh-completions
  pulumi
  # pyenv
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

source "${ZSH}/oh-my-zsh.sh"

source "${HOME}/repos/oh-my-zsh-extensions/themes/zsh-syntax/zsh-syntax-highlighting.sh"

source "${HOME}/.local/share/autojump/autojump.zsh"

# source all shell files
DIRS=(creds utils work)
for d in $DIRS; do
  for f in $HOME/.${d}/*; do
    if [[ "${f: -3}" == ".sh" ]]; then
      source $f;
    fi
  done
done

# ipython env
export IPYTHONDIR="${HOME}/.ipython"

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

# Use bat/batcat when running `man <package>`
export MANPAGER="sh -c 'bat -l man -p'"

# Do not remove slash from dir
# https://unix.stackexchange.com/questions/160026/how-can-i-keep-the-trailing-slash-after-choosing-a-directory-from-the-zsh-comple
setopt no_auto_remove_slash

# Set dracula colors for fzf default, since not everything used this scheme
export FZF_DEFAULT_OPTS='
  --color fg:255,hl:84,fg+:255,bg+:236,hl+:215
  --color info:141,prompt:84,spinner:212,pointer:212,marker:212
'

# Cannot toggle delta configs if they are in ~/.gitconfig
export DELTA_FEATURES=+side-by-side

# Show if in nix shell
prompt_nix_shell_setup

# Activate nix zsh shim
source $ZSH_CUSTOM/plugins/zsh-nix-shell/nix-shell.plugin.zsh

# Suppress direnv startup noise
# export DIRENV_LOG_FORMAT=

# https://stackoverflow.com/questions/3160909/how-do-i-deal-with-certificates-using-curl-while-trying-to-access-an-https-url
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Setting this for consistency
export NIX_SSL_CERT_FILE=$CURL_CA_BUNDLE

# Most aliases
alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"
alias awk3="awk '{print \$3}'"
alias awk4="awk '{print \$4}'"
alias awk5="awk '{print \$5}'"
alias awk6="awk '{print \$6}'"
alias awk7="awk '{print \$7}'"
alias awk8="awk '{print \$8}'"
alias awk9="awk '{print \$9}'"
alias b="bat --theme Dracula"
alias c="bat --theme Dracula"
alias ch="clickhouse-client --vertical"
alias cpcstdin="copyq copy - &> /dev/null"
alias cpc-stdin="copyq copy - &> /dev/null"
alias dk="docker"
alias direnva="direnv allow ~/.envrc && exec zsh"
alias direnvd="direnv disallow ~/.envrc && exec zsh"
alias g="git"
alias ggrep="git grep"
alias head1="head -n 1"
alias head2="head -n 2"
alias head3="head -n 3"
alias head4="head -n 4"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias ipy="ipython"
alias jc="python -m jc"
alias nm="neomutt"
alias pg="pgcli"
alias pu="pulumi"
alias sortu="sort -u"
alias t="pwd && tre -e"
alias v="nvim"
alias vp="nvim -p"

# Source os specific shell configs
if grep --quiet Ubuntu /etc/os-release; then
  source ~/.zsh_profiles/ubuntu.zsh
fi

# Pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init --path)"

# Activate home python venv after nix
source ${HOME}/venv/bin/activate

# Disable pythonpath (since nix messes with it)
# export PYTHONPATH=''

# Mise
eval "$(mise activate zsh)"
