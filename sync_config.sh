#!/bin/bash

# Create necessary directories
mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins

# Copy main init file
cp -f init.lua ~/.config/nvim/

# Copy config files
cp -f lua/config/options.lua ~/.config/nvim/lua/config/
cp -f lua/config/keymaps.lua ~/.config/nvim/lua/config/
cp -f lua/config/lazy.lua ~/.config/nvim/lua/config/

# Copy plugin files
cp -f lua/plugins/lsp.lua ~/.config/nvim/lua/plugins/
cp -f lua/plugins/completion.lua ~/.config/nvim/lua/plugins/
cp -f lua/plugins/ui.lua ~/.config/nvim/lua/plugins/
cp -f lua/plugins/treesitter.lua ~/.config/nvim/lua/plugins/
cp -f lua/plugins/ai.lua ~/.config/nvim/lua/plugins/
cp -f lua/plugins/editor.lua ~/.config/nvim/lua/plugins/

echo "✅ Neovim configuration synced successfully!"
echo "📁 Files copied to ~/.config/nvim/"
echo "🚀 Launch nvim to let lazy.nvim install plugins"
