#!/bin/bash
set -e

BINARY=~/downloads/bin/bat
if [ -f "$BINARY" ]; then
    echo "bat already installed."
    exit 0
fi

version=v0.25.0
mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/sharkdp/bat/releases/download/$version/bat-$version-x86_64-unknown-linux-musl.tar.gz
tar -xzvf bat-$version-x86_64-unknown-linux-musl.tar.gz

cp bat-$version-x86_64-unknown-linux-musl/bat ~/downloads/bin/

