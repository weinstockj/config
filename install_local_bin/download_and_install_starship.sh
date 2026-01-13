#!/bin/bash
set -e

BINARY=~/downloads/bin/starship
if [ -f "$BINARY" ]; then
    echo "starship already installed."
    exit 0
fi

mkdir -p ~/downloads/bin/
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/downloads/bin -y

