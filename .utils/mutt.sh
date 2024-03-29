#!/bin/bash

# Check if the current account is gmail or outlook
# Then alias mutt commands accordingly
mutt_dir="~/.mutt/$MUTT_USER"
gmail_dir="$mutt_dir/\[Gmail\]"
if [ -d "$gmail_dir" ]; then
  inbox_dir="$gmail_dir/All\ Mail/"
  draft_dir="$gmail_dir/Drafts"
  sent_dir="$gmail_dir/Sent\ Mail"
else
  inbox_dir="$mutt_dir/inbox"
  draft_dir="$mutt_dir/Drafts"
  sent_dir="$mutt_dir/Sent\ Items"
fi

alias m="neomutt"
alias mm="sync_current_mailbox && neomutt"
alias mdrft="neomutt -f $draft_dir"
alias mr="neomutt -R -f $inbox_dir"  # Read only mode
alias ms="neomutt -f $sent_dir"

sync_current_mailbox(){
  echo $MUTT_USER
  mbsync -a -c ~/.mutt/"$MUTT_USER"/.mbsyncrc
}

# This script sets up mbsync for gmail
setup_isync_mailboxes(){
  set -ux pipefail

  # Create and enter mutt dir
  cd $HOME
  mkdir -p .mutt
  cd .mutt

  for f in ~/.creds/*; do

    # Ignore readme file
    if [ "${f: -3}" != ".md" ]; then

      # For every mutt credentials file,
      # create a user dir
      source "$f"
      mkdir -p $MUTT_USER
      mkdir -p "$MUTT_USER/inbox"

      # Copy template file if it has been updated
      cp -u ~/.mbsyncrc "$MUTT_USER/.mbsyncrc"

      # Replace user name, password placeholders in the rc file
      sd 'MY_USER' "$MUTT_USER" "$MUTT_USER/.mbsyncrc"
      sd 'MY_PWD' "$MUTT_PWD" "$MUTT_USER/.mbsyncrc"
      sd 'MY_EMAIL_ADDR' "$MUTT_EMAIL_ADDR" "$MUTT_USER/.mbsyncrc"
      sd 'MY_HOST' "$MUTT_HOST" "$MUTT_USER/.mbsyncrc"

    fi

  done

  set +ux pipefail
}
