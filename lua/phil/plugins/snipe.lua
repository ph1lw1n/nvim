return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "<leader><leader>",
      -- "<S-l>", -- uncomment if you wanna use other buffer from keymap
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Search Buffer",
    },
  },
  config = function()
    local snipe = require("snipe")
    snipe.setup({
      hints = {
        dictionary = "asdfghl;wertyuiop", -- Characters to use for hints
      },
      navigate = {
        cancel_snipe = "q", -- Cancel navigation
        close_buffer = "x", -- Close the buffer
      },
      sort = "default", -- Sort buffers by default order
    })
  end,
}
