#!/usr/bin/env bash

set -exo pipefail

usage() {
  echo "Usage: $0 [-v] [-n] [-- COMMAND [ARGS...]]"
  echo "  -p  Mount the current directory"
  echo "  -a  Mount auth credentials"
  echo "  -r  Mount the entire root pi config directory"
  exit 1
}

MOUNT_CURRENT_DIR=false
MOUNT_AUTH_DIR=false
MOUNT_PI_DIR=false
while getopts ":par" opt; do
  case ${opt} in
    p) MOUNT_CURRENT_DIR=true ;;
    a) MOUNT_AUTH_DIR=true ;;
    r) MOUNT_PI_DIR=true ;;
    *) usage ;;
  esac
done
shift $((OPTIND - 1))

if [[ "${MOUNT_CURRENT_DIR}" == true ]]; then
  VOLUME_PWD="--volume $(pwd):/workspace"
fi

if [[ "${MOUNT_AUTH_DIR}" == true ]]; then
  VOLUME_AUTH="--volume $HOME/.pi/agent/auth.json:/root/.pi/agent/auth.json"
fi

if [[ "${MOUNT_PI_DIR}" == true ]]; then
  # Add another mount to avoid overwriting actual dracula files on host
  VOLUME_PI="--volume $HOME/.pi/:/root/.pi/ --volume dracula:/root/.pi/agent/themes/"
fi

docker run \
  --rm \
  -it \
  $VOLUME_PWD \
  $VOLUME_AUTH \
  $VOLUME_PI \
  pi:latest \
  "$@"
