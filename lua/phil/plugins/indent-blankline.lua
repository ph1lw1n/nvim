return {
  'lukas-reineke/indent-blankline.nvim',
  event = { "BufReadPre", "BufNewFile" },
  main = 'ibl',
  opts = {
    indent = {
      -- char = '┊',  -- choose a style
      -- char = '▏',
      -- char = '⋮',
      char = '│',
    },
    
    scope = {
      show_start = false,
      show_end = false,
      show_exact_scope = false,
    },
    exclude = {
      filetypes = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
      },
    },
  },
}
