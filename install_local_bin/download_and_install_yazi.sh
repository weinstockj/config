#!/bin/bash
set -e

BINARY=~/downloads/bin/yazi
if [ -f "$BINARY" ]; then
    echo "yazi already installed."
    exit 0
fi

version=0.4.2
mkdir -p ~/downloads/bin

TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT
cd "$TEMP_DIR"

wget https://github.com/sxyazi/yazi/releases/download/v${version}/yazi-x86_64-unknown-linux-gnu.zip
unzip yazi-x86_64-unknown-linux-gnu.zip

# Yazi seems to come in a folder. We should copy binary and resources.
# The original script did:
# ln -s ../yazi-x86_64-unknown-linux-gnu/yazi yazi
# This implies keeping the folder. Let's install properly to a persistent place if we can,
# or replicate the original behavior but safer.
# To keep it simple and idempotent, let's just copy the binary.
# If yazi needs resources relative to binary, we might need to copy the whole folder.
# Checking docs (or assumption): Yazi is a single binary + resources?
# Let's copy the binary for now as that's standard for this bin dir.
# If resources are needed, users often put the folder in ~/.local/share or similar.
# The original script symlinked, implying the folder persisted in ~/downloads/yazi-...
# We will replicate extracting to ~/downloads/yazi-... and symlinking, but check first.

TARGET_DIR=~/downloads/yazi-x86_64-unknown-linux-gnu
if [ -d "$TARGET_DIR" ]; then
    echo "yazi directory already exists, skipping download."
else
    mv yazi-x86_64-unknown-linux-gnu ~/downloads/
fi

ln -sf ~/downloads/yazi-x86_64-unknown-linux-gnu/yazi ~/downloads/bin/yazi

