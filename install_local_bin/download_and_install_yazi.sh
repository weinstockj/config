#!/bin/bash
version=0.4.2
mkdir -p ~/downloads/bin
cd ~/downloads
wget https://github.com/sxyazi/yazi/releases/download/v${version}/yazi-x86_64-unknown-linux-gnu.zip
unzip yazi-x86_64-unknown-linux-gnu.zip
cd bin 
ln -s ../yazi-x86_64-unknown-linux-gnu/yazi yazi
