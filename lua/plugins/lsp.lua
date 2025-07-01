return {
  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP config bridge
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "r_language_server", 
          "bashls",
          "pylsp",
          "lua_ls",
        },
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { 
      "mason.nvim", 
      "mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
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

      -- Configure individual language servers
      local servers = {
        rust_analyzer = {},
        r_language_server = {},
        bashls = {},
        pylsp = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
      }

      -- Setup servers
      for server, config in pairs(servers) do
        config.on_attach = on_attach
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
    end,
  },
}