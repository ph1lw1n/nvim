-- Highlight when yanking (copying) text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- Create the autocommand with a description and explicit pattern
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*", -- Explicitly matches all file types
})

-- Restore Cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor to last position",
  group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
    end
  end,
})

-- Automatically trim trailing whitepace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Trim trailing whitespace on save",
  group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Auto-reload Neovim Config
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Reload Neovim configuration on save",
  group = vim.api.nvim_create_augroup("ReloadConfig", { clear = true }),
  pattern = "init.lua,lua/**/*.lua",
  callback = function()
    vim.cmd("source " .. vim.fn.expand("<afile>")) -- Source the saved file
    vim.notify("Neovim configuration reloaded!", vim.log.levels.INFO)
  end,
})

-- Hightlight the current line in only active Window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  desc = "Highlight cursor line in active window",
  group = vim.api.nvim_create_augroup("CursorLineActive", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  desc = "Remove cursor line highlight in inactive window",
  group = vim.api.nvim_create_augroup("CursorLineInactive", { clear = true }),
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Resize Splits
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Resize splits proportionally on Vim resize",
  group = vim.api.nvim_create_augroup("AutoResizeSplits", { clear = true }),
  command = "wincmd =",
})

-- Automatically open a terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Enter insert mode automatically in terminal",
  group = vim.api.nvim_create_augroup("AutoTermInsert", { clear = true }),
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Auto-close Quickfix list
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  desc = "Close quickfix if empty",
  group = vim.api.nvim_create_augroup("AutoCloseQuickfix", { clear = true }),
  pattern = "[^l]*",
  callback = function()
    if vim.fn.empty(vim.fn.getqflist()) == 1 then
      vim.cmd("cclose")
    end
  end,
})
