#!/bin/bash
set -e

echo "Installing CLI tools..."
for script in install_local_bin/*.sh; do
    if [ "$script" == "install_local_bin/install_all.sh" ]; then
        continue
    fi
    
    echo "Running $script..."
    bash "$script"
done

echo "All tools installed successfully!"
