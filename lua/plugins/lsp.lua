return {
  -- Mason for managing LSP servers
  {
    "mason-org/mason.nvim",
    lazy = true,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP config bridge
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "r_language_server", 
          "bashls",
          "pylsp",
        },
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { 
      "mason.nvim", 
      "mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP on_attach function for keymaps and settings
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        
        -- Set up LSP keymaps
        if _G.lsp_keymaps then
          _G.lsp_keymaps(bufnr)
        end
      end

      -- Configure individual language servers using vim.lsp.config
      vim.lsp.config('*', {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config.rust_analyzer = {}
      vim.lsp.config.r_language_server = {}
      vim.lsp.config.bashls = {}
      vim.lsp.config.pylsp = {}
      -- Enable the language servers
      vim.lsp.enable({ 'rust_analyzer', 'r_language_server', 'bashls', 'pylsp' })
    end,
  },
}
