#!/bin/bash

version="0.49.0"

mkdir -p ~/downloads/bin/
cd ~/downloads/

wget https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_x86_64.tar.gz
tar -xzf lazygit_${version}_Linux_x86_64.tar.gz
mv lazygit ~/downloads/bin/
