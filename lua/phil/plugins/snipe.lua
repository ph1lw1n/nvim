return {
  "leath-dub/snipe.nvim",
  keys = {
    {
      "<S-l>",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Snipe buffer menu",
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
