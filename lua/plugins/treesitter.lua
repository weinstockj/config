return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'c', 
          'lua', 
          'vim', 
          'vimdoc', 
          'query', 
          'markdown', 
          'markdown_inline', 
          'r', 
          'bash', 
          'julia', 
          'python', 
          'rust',
          'json',
          'yaml',
          'toml',
        },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            -- HPC Optimization: Disable for large files on slow I/O
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
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