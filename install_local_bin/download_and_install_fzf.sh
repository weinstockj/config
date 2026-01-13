#!/bin/bash
set -e

BINARY=~/downloads/bin/fzf
if [ -f "$BINARY" ]; then
    echo "fzf already installed."
    exit 0
fi

version=0.38.0
mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/junegunn/fzf/releases/download/$version/fzf-$version-linux_amd64.tar.gz
tar -xzvf fzf-$version-linux_amd64.tar.gz
cp fzf ~/downloads/bin/


