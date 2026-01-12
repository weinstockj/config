local keymap = vim.keymap

-- General keymaps from init.vim
keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })
keymap.set("n", "<C-L>", ":nohl<CR><C-L>", { desc = "Clear search highlighting and redraw" })

-- Diagnostic keymaps from init.lua
local opts = { noremap = true, silent = true }
keymap.set('n', '<space>e', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = "Open diagnostic float" }))
keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = "Go to previous diagnostic" }))
keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = "Go to next diagnostic" }))
keymap.set('n', '<space>q', vim.diagnostic.setloclist, vim.tbl_extend('force', opts, { desc = "Open diagnostic quickfix list" }))

-- CodeCompanion keymaps from init.lua
keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "CodeCompanion Actions" })
keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true, desc = "Toggle CodeCompanion Chat" })
keymap.set("v", "ga", "<cmd>CodeCompanion Chat Add<cr>", { noremap = true, silent = true, desc = "Add selection to CodeCompanion Chat" })

-- Telescope keymaps
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })

-- Buffer navigation
keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- File explorer
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })

-- LSP keymaps (will be set by LSP on_attach function)
local function lsp_keymaps(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  
  keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', bufopts, { desc = "Go to declaration" }))
  keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', bufopts, { desc = "Go to definition" }))
  keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', bufopts, { desc = "Hover documentation" }))
  keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', bufopts, { desc = "Go to implementation" }))
  keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', bufopts, { desc = "Signature help" }))
  keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', bufopts, { desc = "Add workspace folder" }))
  keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', bufopts, { desc = "Remove workspace folder" }))
  keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, vim.tbl_extend('force', bufopts, { desc = "List workspace folders" }))
  keymap.set('n', '<space>D', vim.lsp.buf.type_definition, vim.tbl_extend('force', bufopts, { desc = "Type definition" }))
  keymap.set('n', '<space>rn', vim.lsp.buf.rename, vim.tbl_extend('force', bufopts, { desc = "Rename symbol" }))
  keymap.set('n', '<space>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', bufopts, { desc = "Code action" }))
  keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', bufopts, { desc = "Go to references" }))
  keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, vim.tbl_extend('force', bufopts, { desc = "Format buffer" }))
end

-- Export the lsp_keymaps function for use in LSP configuration
_G.lsp_keymaps = lsp_keymaps