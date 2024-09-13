#!/bin/bash
#
# Override nix zsh prompt
# original lines commented out

function prompt_nix_shell_precmd {
  if [[ -n ${IN_NIX_SHELL} && ${IN_NIX_SHELL} != "0" || ${IN_NIX_RUN} && ${IN_NIX_RUN} != "0" ]]; then
    if [[ -n ${IN_WHICH_NIX_SHELL} ]] then
      # NIX_SHELL_NAME=": ${IN_WHICH_NIX_SHELL}"
      NIX_SHELL_NAME="${IN_WHICH_NIX_SHELL}"
    fi
    # if [[ -n ${IN_NIX_SHELL} && ${IN_NIX_SHELL} != "0" ]]; then
    #   NAME="nix"
    # else
    #   NAME="nix-run"
    # fi
    # NIX_PROMPT="%F{8}[%F{3}${NAME}${NIX_SHELL_NAME}%F{8}]%f"
    NIX_PROMPT="%F{8}[%F{3}${NIX_SHELL_NAME}%F{8}]%f"
    if [[ $PROMPT != *"$NIX_PROMPT"* ]] then
      PROMPT="$NIX_PROMPT $PROMPT"
    fi
  fi
}
