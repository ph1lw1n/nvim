-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Load this plugin first
  opts = {
    style = "night", -- Theme style
    transparent = true, -- Set transparency (adjust as needed)
    styles = {
      sidebars = "transparent", -- Sidebar style transparent / dark
      floats = "transparent", -- Floating window style
    },
  },
  config = function(_, opts)
    -- Pass the options to the plugin setup
    require("tokyonight").setup(opts)

    -- Apply the colorscheme
    vim.cmd.colorscheme("tokyonight-night")

    -- Customize highlights (example: make comments not italic)
    vim.api.nvim_set_hl(0, "Comment", { italic = false })
  end,
}
