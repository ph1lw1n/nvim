-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
return {
  "nvim-tree/nvim-web-devicons",
  "RRethy/vim-illuminate", -- highlighting same words
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  "tpope/vim-fugitive", -- Powerful Git integration for Vim
  "tpope/vim-rhubarb", -- Github integration for vim-fugitive
  "norcalli/nvim-colorizer.lua", -- High-performance color highlighter
  config = function()
    require("colorizer").setup()
  end,
}
