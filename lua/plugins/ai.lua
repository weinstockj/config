return {
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = false },
      })
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup()
    end,
  },

  -- CodeCompanion
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("codecompanion").setup()
      
      -- Command abbreviation
      vim.cmd([[cab cc CodeCompanion]])
    end,
  },

  -- Language specific support

  {
    "snakemake/snakemake",
    ft = "snakemake",
    config = function()
      vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
        pattern = { "Snakefile", "*.smk", "*.snakemake" },
        callback = function()
          vim.bo.filetype = "snakemake"
        end,
      })
    end,
  },
}