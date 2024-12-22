-- Toggle terminal integration
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      -- Add any custom setup for toggleterm here
    })
    vim.keymap.set("n", "T", ":ToggleTerm dir=%:p:h<CR>", { desc = "Terminal" })
  end,
}
