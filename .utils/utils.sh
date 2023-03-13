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
  ctags -f $HOME/.ctags/tags --recurse=yes --exclude=.git "$pydir"
}

# Slight duplicate to hack around inconsistent bat installs
if ! type bat &>/dev/null ; then
  bat_cmd="batcat"
else
  bat_cmd="bat"
fi

# Fuzzy commands
# Template find command and ignore a few top level dirs
__FD="fd --no-ignore -E backups -E dbt-autocomplete -E dracula -E google-cloud-sdk -E venv -E vgrep"
__FZF_PREVIEW="if [ -d {} ]; then tree -C {} | head -200; else $bat_cmd --style=numbers --color=always --line-range :500 {}; fi"
__FZF_PREVIEW_VFGREP=" n={3}; if (( \$n < 10 )); then m=0; else m=\$((\$n-5)); fi; bat {2} --style=numbers --color=always --highlight-line {3} --line-range \$m: "
# __FZF_BIND='f8:execute(terminator --new-tab {})'
__FZF_BIND='f8:execute(vim {} < /dev/tty)'

# Return the selected file, like regular fzf
fzfd(){
  eval $__FD | fzf -m --height 60% --preview $__FZF_PREVIEW --bind $__FZF_BIND
}

# Copy a file into clipboard using fzf
copyfz(){
  copy cat "$(fzf -m --height 60% --preview $__FZF_PREVIEW --bind $__FZF_BIND)"
}

# Open the selected files in vim
vf(){
  files=$(fzfd)
  if [[ "$files" != "" ]]; then
    vim -p $(echo $files)
  fi
}

# fzf-vgrep then open in vim
# If an arg is provided, then do not ignore hidden dirs and pass in the search string
vfgrep() {
  if [ -z "$1" ]; then
    include_hidden_files=""
    search_arg=""
  else
    include_hidden_files="--no-git"
    search_arg="$1"
  fi
  files=$(vgrep --no-header $include_hidden_files "$search_arg" | fzf -m --height 60% --preview $__FZF_PREVIEW_VFGREP --bind "change:reload:vgrep $include_hidden_files --no-header {q} || true" --ansi --phony --tac | \
    awk '{if (NR==1) {print("+" $3, $2)} else {print("+\"tabnew +" $3, $2 "\"")}}' ORS=' ')
  if [[ "$files" != "" ]]; then
    eval 'vim' "$files"
  fi
}

sdgrep(){
  query=$(vgrep --no-header | \
    fzf --height 60% --bind "change:reload:vgrep --no-header {q} || true" --ansi --phony --tac --print-query | \
    awk 'NR==1 {print}'
  )
  while true; do
    print -n -P "%F{cyan}%BReplacement: "
    read replacement
    sd "$query" "$replacement" $(fd --type f)
    git diff
    print -n -P "%F{cyan}%BAccept? (Y/N): "
    read accept
    case $accept in
      [Yy]* ) break ;;
      [Nn]* ) git checkout . 2>/dev/null ;;
    esac
  done
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
  else;
    bat "$1" | jq -C ".nodes[$selection]" | less
  fi
}

# Horizontal cat using python
hcat(){
  python -c 'import sys, pandas as pd; pd.set_option("display.max_columns", None); pd.set_option("display.max_rows", None); print(pd.read_csv(sys.argv[1], nrows=3).head(1).T)' "$1"
}

# Check if an ip address is public or private
is-ip-private(){
  if echo "$1" | grep --quiet -E '^(192\.168|10\.|172\.1[6789]\.|172\.2[0-9]\.|172\.3[01]\.)' ; then
    echo "Private: $1" ;
  else
    echo "Public: $1" ;
  fi
}