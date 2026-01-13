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
opt.cmdheight = 1
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
opt.completeopt = { "menu", "menuone", "noselect" }

-- ============================================================================
-- HPC Performance Optimizations
-- ============================================================================
-- Reduce I/O operations on slow HPC filesystems
opt.swapfile = false      -- Disable swap files (avoid I/O)
opt.backup = false        -- No backup files
opt.writebackup = false   -- No backup before overwriting
opt.updatetime = 1000     -- Increase updatetime (default 300) to reduce frequent background checks
opt.shada = "!,'100,<50,s10,h" -- Limit Shada file: no global vars, max 100 files, <50 lines/reg, max 10KB size, disable hlsearch save
opt.timeoutlen = 500      -- Faster key sequence completion

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Plugin-specific globals
vim.g.ctrlp_cache_dir = vim.fn.expand("$HOME") .. "/.cache/ctrlp"
if vim.fn.executable("ag") == 1 then
  vim.g.ctrlp_user_command = 'ag %s -l --nocolor -g ""'
end

