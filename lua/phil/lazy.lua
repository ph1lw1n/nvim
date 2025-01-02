-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. result)
  end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Set up lazy.nvim ]]
require("lazy").setup({
  { import = "phil.plugins" },
  { import = "phil.plugins.lsp" },
  { import = "phil.plugins.ui" },
  { import = "phil.plugins.git" },
  { import = "phil.plugins.productivity" },
  { import = "phil.plugins.filemanagement" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
