#!/bin/bash

# Run vgrep but discard the output
# Then start an interactive vgrep session
ivgrep()
{
  vgrep "$1" > /dev/null
  vgrep --interactive
}

# Find replace using grep + sed
# Note: sed is not consistent across OSs
grep_find_replace(){
  if [[ "$OSTYPE" == "darwin20.0" ]]; then
    files=$(grep -rl "$1" .)
    if [ -z "$files" ]; then
      echo "Pattern not found: $1"
    else
      echo "$files" | xargs sed -i "" "s/$1/$2/g"
    fi
  else
    echo "OS not supported!"
  fi
}

# Remove entire line from file
# by writing to a new file
# then moving it back
grep_remove_line(){
    files=$(grep -rl "$1" .)
    if [ -z "$files" ]; then
      echo "Pattern not found: $1"
      echo "In file: $2"
    else
      grep -vwE "$1" "$2" > "$2".tmp
      mv "$2".tmp "$2"
    fi
}
