#!/bin/bash
set -e

if [ -d "$HOME/.nvm" ]; then
    echo "nvm already installed."
    exit 0
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

