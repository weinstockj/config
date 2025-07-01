# Neovim Configuration

A modern, modular Neovim configuration using lazy.nvim for plugin management, featuring LSP, completion, AI tools, and optimized performance.

## Features

- 🚀 **Fast startup** with lazy loading
- 🔧 **Language Server Protocol** support for multiple languages
- ✨ **Intelligent completion** with nvim-cmp
- 🎨 **Syntax highlighting** with TreeSitter
- 🤖 **AI integration** with Copilot and CodeCompanion
- 📁 **File management** with Neo-tree and Telescope
- 🎯 **Modern UI** with Lualine and Tokyo Night theme

## Quick Start

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Install configuration**:
   ```bash
   ./sync_config.sh
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```
   
   On first run, lazy.nvim will automatically install all plugins and dependencies.

## Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua        # Plugin manager setup
│   │   ├── options.lua     # Neovim options
│   │   └── keymaps.lua     # Key mappings
│   └── plugins/
│       ├── ai.lua          # Copilot & CodeCompanion
│       ├── completion.lua  # nvim-cmp setup
│       ├── lsp.lua         # Language servers
│       ├── treesitter.lua  # Syntax highlighting
│       └── ui.lua          # Themes & interface
```

## Language Support

### Supported Languages
- **Rust** (rust_analyzer)
- **Python** (pylsp)
- **R** (r_language_server)
- **Julia** (julials)
- **Bash** (bashls)
- **Lua** (lua_ls)

### TreeSitter Parsers
- C, Lua, Vim, Python, Rust, R, Bash, Julia
- Markdown, JSON, YAML, TOML
- And more...

## Key Mappings

### General
| Key | Mode | Action |
|-----|------|--------|
| `,` | Normal | Leader key |
| `Y` | Normal | Yank to end of line |
| `<C-L>` | Normal | Clear search highlighting |

### LSP (when LSP server is active)
| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gr` | Normal | Go to references |
| `K` | Normal | Hover documentation |
| `<space>rn` | Normal | Rename symbol |
| `<space>ca` | Normal | Code actions |
| `<space>f` | Normal | Format buffer |

### Diagnostics
| Key | Mode | Action |
|-----|------|--------|
| `<space>e` | Normal | Open diagnostic float |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |
| `<space>q` | Normal | Diagnostic quickfix |

### AI Tools
| Key | Mode | Action |
|-----|------|--------|
| `<C-a>` | Normal/Visual | CodeCompanion actions |
| `<LocalLeader>a` | Normal/Visual | Toggle CodeCompanion chat |
| `ga` | Visual | Add selection to CodeCompanion |

### Completion
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<CR>` | Insert | Confirm selection |
| `<C-e>` | Insert | Abort completion |
| `<C-b>/<C-f>` | Insert | Scroll docs |

## Plugin Management

### Common Commands
```vim
:Lazy                " Open plugin manager
:Lazy install        " Install missing plugins
:Lazy update         " Update all plugins
:Lazy clean          " Remove unused plugins
:Lazy sync           " Install + update + clean
```

### LSP Management
```vim
:Mason              " Open LSP server manager
:MasonInstall <server>  " Install LSP server
:LspInfo            " Show LSP server status
```

## Customization

### Adding New Plugins
Create a new file in `lua/plugins/` or add to existing ones:

```lua
return {
  {
    "author/plugin-name",
    event = "VeryLazy",  -- or other lazy-loading trigger
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Modifying Settings
- **Options**: Edit `lua/config/options.lua`
- **Keymaps**: Edit `lua/config/keymaps.lua`
- **Theme**: Change colorscheme in `lua/plugins/ui.lua`

### Adding Language Servers
1. Add server name to `ensure_installed` in `lua/plugins/lsp.lua`
2. Add server configuration to the `servers` table
3. Restart Neovim and run `:Mason` to install

## Development Workflow

### Setup New Projects
1. Open project directory: `nvim .`
2. Use `:Neotree` to explore files
3. LSP will automatically activate for supported file types
4. Use `:Telescope find_files` for fuzzy file search

### Code Navigation
- `gd` - Jump to definition
- `<C-o>` - Jump back
- `:Telescope lsp_references` - Find all references
- `:Telescope diagnostics` - Browse diagnostics

### AI-Assisted Development
- Select code and use `ga` to add to CodeCompanion
- Use `<C-a>` for quick AI actions
- Copilot provides inline suggestions while typing

## Troubleshooting

### Plugin Issues
```vim
:checkhealth        " Check overall health
:Lazy profile       " Check plugin load times
:LspInfo           " Check LSP server status
```

### Performance
- Startup time: `nvim --startuptime startup.log`
- Plugin profiling available in `:Lazy`

### Common Issues
1. **LSP not working**: Check `:LspInfo` and ensure servers are installed via `:Mason`
2. **Slow startup**: Check `:Lazy profile` for problematic plugins
3. **Completion not working**: Ensure LSP server is running and nvim-cmp is configured

## Backup and Sync

The configuration includes sync scripts:
- `sync_config.sh` - Sync config changes
- Backup files created as `.backup` during migration

## Additional Tools

This repo also includes installation scripts for development tools:
- **bat** - Better cat with syntax highlighting
- **fzf** - Fuzzy finder
- **lazygit** - Git UI
- **ripgrep** - Fast grep alternative
- **starship** - Cross-shell prompt
- **yazi** - Terminal file manager

Install individually from `install_local_bin/` directory.

## Contributing

This is a personal configuration, but feel free to:
1. Fork and adapt for your needs
2. Report issues or suggest improvements
3. Share your own modifications

## License

Personal configuration - use as inspiration for your own setup!
