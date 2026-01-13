#!/bin/bash
set -e

BINARY=~/downloads/bin/fd
if [ -f "$BINARY" ]; then
    echo "fd already installed."
    exit 0
fi

version=10.1.0
mkdir -p ~/downloads/bin/

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/sharkdp/fd/releases/download/v$version/fd-v$version-x86_64-unknown-linux-musl.tar.gz
tar -xzvf fd-v$version-x86_64-unknown-linux-musl.tar.gz
cp fd-v$version-x86_64-unknown-linux-musl/fd ~/downloads/bin/

