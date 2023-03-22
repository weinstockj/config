#!/bin/bash
#
version=v0.22.1
wget https://github.com/sharkdp/bat/releases/download/$version/bat-$version-x86_64-unknown-linux-musl.tar.gz

tar -xzvf bat-$version-x86_64-unknown-linux-musl.tar.gz

cp bat-$version-x86_64-unknown-linux-musl/bat ~/downloads/bin