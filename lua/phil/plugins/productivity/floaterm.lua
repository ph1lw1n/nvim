return {
  "voldikss/vim-floaterm",
  config = function()
    -- Global settings for Floaterm
    vim.g.floaterm_width = 0.8 -- Set width as 80% of screen
    vim.g.floaterm_height = 0.7 -- Set height as 70% of screen
    vim.g.floaterm_wintype = "float" -- Use floating window
    vim.g.floaterm_position = "center" -- Center the terminal
    vim.g.floaterm_autoclose = 2 -- Close terminal when process exits

    -- Keybindings
    vim.keymap.set("n", "T", "<cmd>FloatermToggle floaterm1<CR>", { desc = "[T]erminal" })
    vim.keymap.set("t", "T", "<cmd>FloatermToggle floaterm1<CR>", { desc = "[T]erminal" }) -- might comment out for writing a "T"
  end,
}
