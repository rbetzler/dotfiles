#!/bin/bash
#
# Get reusable ssh, sops/age keys from bitwarden
# Reencrypt sops files
# Push new personal ssh key to server
#
# Globals
#   BW_USERNAME
#   BW_PASSWORD
#   BW_HOST_NAME
#   BW_PORT
#   SSH_PORT
#   SSH_USER

set -exo pipefail

# Credentials
export BW_HOST="${BW_HOST_NAME}:${BW_PORT}"
export BW_URL="https://${BW_HOST}"

# Logout just in case, ignore exit code
set +e
bw logout
set -e

# Get self signed cert
echo | openssl s_client -showcerts -connect "$BW_HOST" 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /tmp/bitwarden.crt
# Ignore ssl/tls
export NODE_TLS_REJECT_UNAUTHORIZED='0' NODE_EXTRA_CA_CERTS=/tmp/bitwarden.crt

# Specify self hosted url
bw config server "$BW_URL"

# Login
bw login "$BW_USERNAME" --raw --passwordenv BW_PASSWORD

# Unlock if needed
export BW_SESSION="$(bw unlock --raw --passwordenv BW_PASSWORD)"

# Sync if changes made on server
bw sync

# Get common_0 sops/age private key
bw list items --search sops_age_common_0 | jq -r '.[].notes' > ~/.config/sops/age/common_0.txt
bw list items --search ssh_common_0 | jq -r '.[].notes' > ~/.ssh/common_0
chmod 600 ~/.ssh/common_0

# Reencrypt sops files
# Manually verify, commit, push
export SOPS_AGE_KEY_FILE=~/.config/sops/age/common_0.txt
fd enc -I --search-path ~/.encrypted/ --search-path ~/.work/ -x sops updatekeys --yes

# Copy personal ssh key to server, then dedup
cat ~/.ssh/personal.pub | ssh "${SSH_USER}@${BW_HOST_NAME}" -i ~/.ssh/common_0 -p "$SSH_PORT" -T "cat >> ~/.ssh/authorized_keys"
ssh "${SSH_USER}@${BW_HOST_NAME}" -i ~/.ssh/common_0 -p "$SSH_PORT" 'sed -i -r "s/[ \t]*$//" ~/.ssh/authorized_keys'
ssh "${SSH_USER}@${BW_HOST_NAME}" -i ~/.ssh/common_0 -p "$SSH_PORT" 'sort -u -o ~/.ssh/authorized_keys ~/.ssh/authorized_keys'

# Clean up temporary keys
rm ~/.ssh/common_0 ~/.config/sops/age/common_0.txt
