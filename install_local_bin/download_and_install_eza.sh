#!/bin/bash
set -e

BINARY=~/downloads/bin/eza
if [ -f "$BINARY" ]; then
    echo "eza already installed."
    exit 0
fi

version=0.18.19
mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/eza-community/eza/releases/download/v$version/eza_x86_64-unknown-linux-musl.tar.gz
tar -xzvf eza_x86_64-unknown-linux-musl.tar.gz
cp ./eza ~/downloads/bin/

