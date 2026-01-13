#!/bin/bash
set -e

BINARY=~/downloads/bin/zoxide
if [ -f "$BINARY" ]; then
    echo "zoxide already installed."
    exit 0
fi

mkdir -p ~/downloads/bin/
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash -s -- --bin-dir ~/downloads/bin

