-- Options from init.vim converted to lua
local opt = vim.opt

-- Compatibility and basic settings
opt.compatible = false
opt.hidden = true
opt.wildmenu = true
opt.showcmd = true
opt.hlsearch = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Editing behavior
opt.backspace = { "indent", "eol", "start" }
opt.autoindent = true
opt.startofline = false

-- UI settings
opt.ruler = true
opt.laststatus = 2
opt.confirm = true
opt.visualbell = true
opt.belloff = "all"
opt.mouse = "a"
opt.cmdheight = 2
opt.number = true
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 200

-- Indentation settings (4 spaces instead of tabs)
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Additional modern settings
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 300
opt.completeopt = { "menu", "menuone", "noselect" }

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Plugin-specific globals
vim.g.ctrlp_cache_dir = vim.fn.expand("$HOME") .. "/.cache/ctrlp"
if vim.fn.executable("ag") == 1 then
  vim.g.ctrlp_user_command = 'ag %s -l --nocolor -g ""'
end

