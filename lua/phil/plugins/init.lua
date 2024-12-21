-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
return {
  "nvim-tree/nvim-web-devicons", -- Add devicons for file icons

  "RRethy/vim-illuminate", -- Highlighting same words

  "nvim-lua/plenary.nvim", -- Lua functions that many plugins use

  "christoomey/vim-tmux-navigator", -- Tmux & split window navigation

  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  "tpope/vim-fugitive", -- Powerful Git integration for Vim

  "tpope/vim-rhubarb", -- GitHub integration for vim-fugitive
  -- Toggle terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    config = function()
      require("toggleterm").setup({
        -- Add any custom setup for toggleterm here
      })
      vim.keymap.set("n", "T", ":ToggleTerm dir=%:p:h<CR>", { desc = "Terminal" })
    end,
  },

  -- High-performance color highlighter
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
