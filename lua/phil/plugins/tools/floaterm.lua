return {
  "voldikss/vim-floaterm",
  -- Remove event, and use `keys` instead:
  keys = {
    -- Normal mode mapping
    {
      "T",
      "<cmd>FloatermToggle floaterm1<CR>",
      mode = "n",
      desc = "[T]erminal",
    },
    -- Terminal mode mapping
    {
      "T",
      "<cmd>FloatermToggle floaterm1<CR>",
      mode = "t",
      desc = "[T]erminal",
    },
  },
  config = function()
    -- Global settings for Floaterm
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.7
    vim.g.floaterm_wintype = "float"
    vim.g.floaterm_position = "center"
    vim.g.floaterm_autoclose = 2
  end,
}
