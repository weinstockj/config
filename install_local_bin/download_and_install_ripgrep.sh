#!/bin/bash

version=13.0.0
wget https://github.com/BurntSushi/ripgrep/releases/download/$version/ripgrep-$version-x86_64-unknown-linux-musl.tar.gz
tar -xzvf ripgrep-$version-x86_64-unknown-linux-musl.tar.gz
cp ripgrep-$version-x86_64-unknown-linux-musl/rg ~/downloads/bin
