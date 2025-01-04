-- Split window management and maximization
return {
  {
    "nvim-focus/focus.nvim",
    event = { "WinNew", "BufWinEnter" }, -- Load when a new window is created or entered
    config = function()
      require("focus").setup({
        enable = true, -- Enable Focus functionality
        autoresize = {
          enable = true, -- Enable automatic resizing
          excluded_filetypes = { "NvimTree", "neo-tree", "alpha", "dashboard" }, -- Exclude specific filetypes
          excluded_buftypes = { "nofile", "terminal" }, -- Exclude specific buffer types
        },
      })
      -- Keybinding for maximizing or equalizing splits
      -- vim.keymap.set( "n", "<leader>sm", "<cmd>FocusMaximise<CR>", { desc = "[M]ax/[M]in" })
      -- vim.keymap.set( "n", "<leader>se", "<cmd>FocusEqualise<CR>", { desc = "[E]qual" })
      vim.keymap.set( "n", "<leader>so", "<cmd>FocusToggle<CR>", { desc = "[O]n/[O]ff" })
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
