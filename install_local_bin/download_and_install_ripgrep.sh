#!/bin/bash
set -e

BINARY=~/downloads/bin/rg
if [ -f "$BINARY" ]; then
    echo "ripgrep already installed."
    exit 0
fi

version=13.0.0
mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/BurntSushi/ripgrep/releases/download/$version/ripgrep-$version-x86_64-unknown-linux-musl.tar.gz
tar -xzvf ripgrep-$version-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-$version-x86_64-unknown-linux-musl/rg ~/downloads/bin/

