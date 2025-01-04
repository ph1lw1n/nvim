return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs", -- or "buffers" depending on your workflow
        separator_style = "slant", -- Style of buffer separators
        always_show_bufferline = true, -- Show bufferline even with a single buffer
      },
    })

    -- -- Keymaps for cycling through buffers
    -- local opts = { noremap = true, silent = true, desc = "Go to Buffer" }
    -- vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts) -- Go to next buffer
    -- vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts) -- Go to previous buffer
  end,
}
