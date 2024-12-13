-- Highlight when yanking (copying) text
-- Create a reusable augroup
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- Create the autocommand with a description and explicit pattern
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*', -- Explicitly matches all file types
})
