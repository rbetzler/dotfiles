#!/bin/bash

# Find replace using grep + sed
# Sed is not consistent across OSs
grepsed(){
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
