#!/bin/bash
set -e

BINARY=~/downloads/bin/lazygit
if [ -f "$BINARY" ]; then
    echo "lazygit already installed."
    exit 0
fi

version="0.49.0"

mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_x86_64.tar.gz
tar -xzf lazygit_${version}_Linux_x86_64.tar.gz
mv lazygit ~/downloads/bin/

