return {
  "echasnovski/mini.nvim",
  version = false, -- Always use the latest version
  config = function()

    -- ----------------------------------------------------------------------------

    -- Mini Icons
    require("mini.icons").setup()

    -- ----------------------------------------------------------------------------

    -- Mini Animate
    require("mini.animate").setup()

    -- ----------------------------------------------------------------------------

    -- Better Around/Inside textobjects
    require("mini.ai").setup({ n_lines = 500 })
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote

    -- ----------------------------------------------------------------------------

    -- Mini Indentscope
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "dashboard", "alpha", "help", "startify", "NvimTree", "Trouble" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    require("mini.indentscope").setup({
      symbol = "│", -- Indent symbol (you can use "▏", "│", "┊", "╎" etc.)
      options = {
        try_as_border = true,
      },
      draw = {
        delay = 50, -- Faster debounce for real-time updates
        -- animation = require("mini.indentscope").gen_animation.none(), -- Disable animations
      },
    })

    -- ----------------------------------------------------------------------------

    -- Mini Surround
    require("mini.surround").setup({
      mappings = {
        add = "s", -- Add surrounding
        delete = "sd", -- Delete surrounding
        replace = "sr", -- Replace surrounding
        find = "sf", -- Find surrounding
        find_left = "sF", -- Find surrounding backwards
        highlight = "sh", -- Highlight surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    })

    -- ----------------------------------------------------------------------------

    -- -- Load external modules first
    -- local mini_files_km = require("config.modules.mini-files-km")
    -- local mini_files_git = require("config.modules.mini-files-git")
    --
    -- -- Mini Files
    -- require("mini.files").setup({
    --   -- No need to copy this inside `setup()`. Will be used automatically.
    --   {
    --     -- Customization of shown content
    --     content = {
    --       -- Predicate for which file system entries to show
    --       filter = nil,
    --       -- What prefix to show to the left of file system entry
    --       prefix = nil,
    --       -- In which order to show file system entries
    --       sort = nil,
    --     },
    --
    --     -- Module mappings created only inside explorer.
    --     -- Use `''` (empty string) to not create one.
    --     mappings = {
    --       close = "q",
    --       go_in = "l",
    --       go_in_plus = "L",
    --       go_out = "h",
    --       go_out_plus = "H",
    --       mark_goto = "'",
    --       mark_set = "m",
    --       reset = "<BS>",
    --       reveal_cwd = "@",
    --       show_help = "g?",
    --       synchronize = "=",
    --       trim_left = "<",
    --       trim_right = ">",
    --     },
    --
    --     -- General options
    --     options = {
    --       -- Whether to delete permanently or move into module-specific trash
    --       permanent_delete = false,
    --       -- Whether to use for editing directories
    --       use_as_default_explorer = true,
    --     },
    --
    --     -- Customization of explorer windows
    --     windows = {
    --       -- Maximum number of windows to show side by side
    --       max_number = math.huge,
    --       -- Whether to show preview of file/directory under cursor
    --       preview = true,
    --       -- Width of focused window
    --       width_focus = 50,
    --       -- Width of non-focused window
    --       width_nofocus = 15,
    --       -- Width of preview window
    --       width_preview = 25,
    --     },
    --   },
    -- })
  end,
}
