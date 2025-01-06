return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    {
      "<leader>u",
      "<cmd>UndotreeToggle<CR>",
      desc = "[U]ndoTree",
    },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SplitWidth = 35
  end,
}
