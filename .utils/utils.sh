#!/bin/bash

# Makes a shell script executable
# according to git
make-executable(){
  chmod u+x "$1"
}

# Copy to system clipboard
cpc(){
  "$@" | xclip -selection clipboard
}

generate-ctags(){
  mkdir -p $HOME/.ctags
  pydir="$(which python | xargs -i dirname {})/../lib/"
  ctags -n -f $HOME/.ctags/tags --recurse=yes --exclude=.git "$pydir"
}

# Return the selected file, like regular fzf
__FD="fd --no-ignore -E backups -E dbt-autocomplete -E dracula -E google-cloud-sdk -E venv -E vgrep"
__FZF_PREVIEW="if [ -d {} ]; then tree -C {} | head -200; else bat --style=numbers --color=always --line-range :500 {}; fi"
__FZF_BIND='f8:execute(nvim {} < /dev/tty)'
fzfd(){
  eval $__FD | fzf -m --height 60% --preview $__FZF_PREVIEW --bind $__FZF_BIND
}

# Copy a file into clipboard using fzf
copyfz(){
  copy cat "$(fzf -m --height 60% --preview $__FZF_PREVIEW --bind $__FZF_BIND)"
}

# Open the selected files in nvim
vf(){
  files=$(fzfd)
  if [[ "$files" != "" ]]; then
    nvim -p $(echo $files)
  fi
}

# fzf-vgrep then open in nvim
# If an arg is provided, then do not ignore hidden dirs and pass in the search string
__FZF_PREVIEW_VFGREP=" n={3}; if (( \$n < 10 )); then m=0; else m=\$((\$n-5)); fi; bat {2} --style=numbers --color=always --highlight-line {3} --line-range \$m: "
vfgrep() {
  if [ -z "$1" ]; then
    include_hidden_files=""
    search_arg=""
  else
    include_hidden_files="--no-git"
    search_arg="$1"
  fi
  files=$(vgrep --no-header $include_hidden_files "$search_arg" | \
    fzf -m --height 60% --preview $__FZF_PREVIEW_VFGREP --bind "change:reload:vgrep $include_hidden_files --no-header {q} || true" --ansi --phony --tac | \
    awk '{if (NR==1) {print("+" $3, $2)} else {print("+\"tabnew +" $3, $2 "\"")}}' ORS=' ')
  if [[ "$files" != "" ]]; then
    eval 'nvim' "$files"
  fi
}

hist(){
  # https://stackoverflow.com/questions/40049546/fix-mismatch-between-data-and-local-in-awk-command
  cmd="$(LC_ALL=C awk --field-separator=';' '{if (substr($1, 1, 1) ~ ":") {print substr($0, index($0, ";")+1)}}' $HOME/.zsh_history | fzf --tiebreak=index)"
  print -z "$cmd"
}

# Scroll and view json with color
cjson(){
  cat "$1" | jq -C | less
}

# Fuzzy jq for dbt manifest
djson(){
  # Remove trailing commas, invalid brackets, lead whitespaces
  # Do not colorize input but do colorize preview
  selection="$(cat "$1" | jq '.nodes | keys' | sed 's/,$//g' | awk '{if(length>1 && $1=$1) {print}}' | fzf --preview "bat $1 | jq -C '.nodes[\"{}\"]'")"
  if [ -z "$selection" ]; then
    echo 'No selection'
  else
    bat "$1" | jq -C ".nodes[$selection]" | less
  fi
}

# Horizontal cat using python
hcat(){
  python -c 'import sys, pandas as pd; pd.set_option("display.max_columns", None); pd.set_option("display.max_rows", None); print(pd.read_csv(sys.argv[1], nrows=3).head(1).T)' "$1"
}

__FZF_PREVIEW_CTAGS="x={}; file_name=\$(echo \$x | awk '{print \$2}') ; line_start=\$(echo \$x | awk '{print \$3}' | awk -F';' '{print \$1}') ; tmp_window_start=\$((\$line_start - 2)) ; window_start=\$(( \$tmp_window_start > 0 ? \$tmp_window_start : 0 )) ; bat --color=always \$file_name --highlight-line \$line_start --line-range \$window_start:"
__FZF_BIND_CTAGS="f8:execute(nvim \$(echo {} | awk '{print \$2}'))"
ftags(){
  cat $HOME/.ctags/tags | fzf --preview $__FZF_PREVIEW_CTAGS --bind $__FZF_BIND_CTAGS
}

# Activate pyenv
activate_pyenv(){
  export PYENV_ROOT="$HOME/repos/pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
}

killzoom(){
  kill $(ps aux | grep '[z]oom' | awk '{print $2}')
}

# Fuzzy find a dir
cdf(){
  file="$(fzf -m --height 60%)"
  dir="$(dirname "$file")"
  cd "$dir"
}

# https://prefetch.net/blog/2020/07/14/decoding-json-web-tokens-jwts-from-the-linux-command-line/
jwtd() {
  jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
  echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
}

fblame(){
  git log --oneline "$1" | fzf --preview "x={} ; hash=\$(echo \$x | awk '{print \$1}') ; git blame \$hash -- $1 | delta ;"
}
