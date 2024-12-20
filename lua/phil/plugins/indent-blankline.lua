return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = "▏",
      -- char = "│",
      -- char = '┊',  -- choose a style
      -- char = '⋮',
    },
    scope = {
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "NvimTree",
        "Trouble",
      },
    },
  },
}
