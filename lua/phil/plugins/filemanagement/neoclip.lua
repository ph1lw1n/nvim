return {
  "AckslD/nvim-neoclip.lua",
  event = "TextYankPost",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    {
      "<leader>n",
      "<cmd>Telescope neoclip<CR>",
      desc = "[N]eoclip",
    },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = { '"', "+", "*" }, -- Include system clipboard registers
      ros = "q",
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      on_select = {
        set_reg = true, -- Ensure the selected entry is set to the register
        move_to_front = true,
        close_telescope = true,
      },
      on_paste = {
        set_reg = true,
        move_to_front = true,
        close_telescope = true,
      },
      on_replay = {
        set_reg = true,
        move_to_front = true,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            paste = "<c-j>",
            paste_behind = "<c-k>",
            replay = "<c-q>", -- replay a macro
            delete = "<c-d>", -- delete an entry
            edit = "<c-e>", -- edit an entry
            custom = {},
          },
          n = {
            select = "<cr>",
            paste = "p",
            --- It is possible to map to more than one key.
            -- paste = { 'p', '<c-p>' },
            paste_behind = "P",
            replay = "q",
            delete = "d",
            edit = "e",
            custom = {},
          },
        },
      },
    })
    -- Load the extension:
    require("telescope").load_extension("neoclip")
  end,
}
