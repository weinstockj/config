return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter').setup({})

      -- Install parsers (async, no-op if already installed)
      require('nvim-treesitter').install({
        'c', 'lua', 'vim', 'vimdoc', 'query',
        'markdown', 'markdown_inline',
        'r', 'bash', 'julia', 'python', 'rust',
        'json', 'yaml', 'toml', 'latex',
      })

      -- Enable treesitter highlighting via Neovim 0.11 built-in API
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          -- HPC Optimization: Disable for large files on slow I/O
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
          if ok and stats and stats.size > max_filesize then
            return
          end
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  -- Treesitter context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0, -- no limit
        trim_scope = 'outer',
      })
    end,
  },
}
