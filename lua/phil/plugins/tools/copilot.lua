return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap(
      "i",
      "<C-l>",
      'copilot#Accept("<CR>")',
      { silent = true, expr = true, script = true }
    )
    vim.api.nvim_set_keymap(
      "i",
      "<C-n>",
      "copilot#Next()",
      { silent = true, expr = true, script = true }
    )
    vim.api.nvim_set_keymap(
      "i",
      "<C-p>",
      "copilot#Previous()",
      { silent = true, expr = true, script = true }
    )
    vim.g.copilot_enabled = true
  end,
}
