#!/bin/bash
set -e

BINARY=~/downloads/bin/delta
if [ -f "$BINARY" ]; then
    echo "delta already installed."
    # We still check config but maybe better to do it always?
    # The prompt asked for idempotency. Re-running config commands is safe.
else
    version=0.16.5
    mkdir -p ~/downloads/bin/

    TEMP_DIR=$(mktemp -d)
    trap 'rm -rf "$TEMP_DIR"' EXIT
    cd "$TEMP_DIR"

    wget https://github.com/dandavison/delta/releases/download/$version/delta-$version-x86_64-unknown-linux-musl.tar.gz
    tar -xzvf delta-$version-x86_64-unknown-linux-musl.tar.gz
    cp delta-$version-x86_64-unknown-linux-musl/delta ~/downloads/bin/
fi

# Configure git to use delta (safe to re-run)
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global delta.light false


