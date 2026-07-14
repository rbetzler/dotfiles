
export STARSHIP_CACHE=~/.cache/starship/logs/zsh
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

source $HOME/repos/antidote/antidote.zsh
# Generate antidote plugin cache if it does not exist
[[ -f "$HOME/.config/antidote/zsh_plugins.zsh" ]] || antidote-load "$HOME/.config/antidote/zsh_plugins.txt"
source $HOME/.config/antidote/zsh_plugins.zsh

# Initialize vi mode early
ZVM_INIT_MODE=sourcing

# Support `..` to back up a directory
setopt AUTO_CD

# Set neovim as default editor
export EDITOR="nvim"

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

# Use ipdb when python comes across `breakpoint()` in a file
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

# https://stackoverflow.com/questions/12508595/ignore-orig-head-in-zsh-git-autocomplete
zstyle ':completion:*:*' ignored-patterns '*ORIG_HEAD'

# Dracula colors for zsh tab autocomplete dropdowns
zstyle ':fzf-tab:*' fzf-flags \
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#ff79c6 \
  --color=info:#8be9fd,prompt:#50fa7b,pointer:#ff79c6 \
  --color=marker:#f1fa8c,spinner:#bd93f9,header:#6272a4

# Use bat/batcat when running `man <package>`
export MANPAGER="sh -c 'bat -l man -p'"

# Do not remove slash from dir
# https://unix.stackexchange.com/questions/160026/how-can-i-keep-the-trailing-slash-after-choosing-a-directory-from-the-zsh-comple
setopt no_auto_remove_slash

# Set dracula colors for fzf default, since not everything used this scheme
export FZF_DEFAULT_OPTS='
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
'

# Cannot toggle delta configs if they are in ~/.gitconfig
export DELTA_FEATURES=+side-by-side

# https://stackoverflow.com/questions/3160909/how-do-i-deal-with-certificates-using-curl-while-trying-to-access-an-https-url
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# Go paths
export PATH="$HOME/go/bin:$PATH"

# Node paths
export PATH="$HOME/.npm-packages/bin:$PATH"
export NODE_PATH="$HOME/.npm-packages/lib/node_modules:$NODE_PATH"

# Pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$PATH"
eval "$(pyenv init --path)"

# Activate home python venv last
source ${HOME}/venv/bin/activate

# Mise
eval "$(mise activate zsh)"
eval "$(fnox activate zsh)"

source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/history.sh
