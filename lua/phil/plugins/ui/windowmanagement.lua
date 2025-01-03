-- Split window management and maximization
return {
  -- Windows.nvim plugin for split window adjustments
  {
    "nvim-focus/focus.nvim",
    config = function()
      require("focus").setup({
        enable = true, -- Enable Focus functionality
        autoresize = {
          enable = true, -- Enable automatic resizing
          excluded_filetypes = { "NvimTree", "alpha", "dashboard" }, -- Exclude specific filetypes
          excluded_buftypes = { "nofile", "terminal" }, -- Exclude specific buffer types
        },
      })
    end,
  },

  -- Vim-maximizer plugin for toggling window maximization
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "[M]ax/[M]in" },
    },
  },

  -- Tmux & split window navigation
  {
    "christoomey/vim-tmux-navigator",
  },
}
