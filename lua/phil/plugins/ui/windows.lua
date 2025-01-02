-- Split window management and maximization
return {
  -- Windows.nvim plugin for split window adjustments
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      -- Set window-related options
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false

      -- Setup the plugin
      require("windows").setup()
    end,
  },

  -- Vim-maximizer plugin for toggling window maximization
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "[M]ax/[M]in" },
    },
  },
}
