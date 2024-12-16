-- Set lualine as statusline
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- Adapted from: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/onedark.lua
    local colors = {
      blue = '#61afef',
      green = '#98c379',
      purple = '#c678dd',
      cyan = '#56b6c2',
      red1 = '#e06c75',
      red2 = '#be5046',
      yellow = '#e5c07b',
      fg = '#abb2bf',
      bg = '#282c34',
      gray1 = '#828997',
      gray2 = '#2c323c',
      gray3 = '#3e4452',
    }
    -- Define Onedark Theme
    local onedark_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.gray3 },
        c = { fg = colors.fg, bg = colors.gray2 },
      },
      command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
      insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
      visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.red2, gui = 'bold' } },
      inactive = {
        a = { fg = colors.gray1, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.gray1, bg = colors.bg },
        c = { fg = colors.gray1, bg = colors.gray2 },
      },
    }

    -- Define Tokyonight Theme
    local tokyonight_colors = require("tokyonight.colors").setup() -- Get Tokyonight Colors
    local tokyonight_theme = {
      normal = {
        a = { fg = tokyonight_colors.bg, bg = tokyonight_colors.blue, gui = 'bold' },
        b = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg_highlight },
        c = { fg = tokyonight_colors.fg, bg = tokyonight_colors.bg },
      },
      insert = { a = { fg = tokyonight_colors.bg, bg = tokyonight_colors.cyan, gui = 'bold' } },
      visual = { a = { fg = tokyonight_colors.bg, bg = tokyonight_colors.purple, gui = 'bold' } },
      replace = { a = { fg = tokyonight_colors.bg, bg = tokyonight_colors.red, gui = 'bold' } },
      inactive = {
        a = { fg = tokyonight_colors.comment, bg = tokyonight_colors.bg, gui = 'bold' },
        b = { fg = tokyonight_colors.comment, bg = tokyonight_colors.bg },
        c = { fg = tokyonight_colors.comment, bg = tokyonight_colors.bg_dark },
      },
    }

    -- Import color theme based on environment variable NVIM_THEME
    local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'tokyonight'

    -- Define a table of themes
    local themes = {
      onedark = onedark_theme,
      tokyonight = tokyonight_theme,
    }

    local mode = {
      'mode',
      fmt = function(str)
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function() -- condition if frame is wide enough
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    -- Setup Lualine
    lualine.setup {
      options = {
        icons_enabled = true,
        theme = themes[env_var_nvim_theme], -- Set theme based on environment variable
        -- Some useful glyphs:
        -- https://www.nerdfonts.com/cheat-sheet
        --             
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { 
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          diagnostics, diff, 
          { 'encoding', cond = hide_in_width }, 
          { 'filetype', cond = hide_in_width } },
          lualine_y = { 'location' },
          lualine_z = { 'progress' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { { 'location', padding = 0 } },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'fugitive' },
      }
    end,
  }
