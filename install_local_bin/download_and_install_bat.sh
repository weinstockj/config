#!/bin/bash
#
version=v0.25.0
mkdir -p ~/downloads/bin/
cd ~/downloads/
wget https://github.com/sharkdp/bat/releases/download/$version/bat-$version-x86_64-unknown-linux-musl.tar.gz

tar -xzvf bat-$version-x86_64-unknown-linux-musl.tar.gz

cp bat-$version-x86_64-unknown-linux-musl/bat ~/downloads/bin
