return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      --- Add a space between comment and the line
      padding = true,
      --- Whether the cursor should stay at its position
      sticky = true,
      --- Keymap changes
      toggler = {
        line = "<leader>//", -- Toggle line comment
        block = "<leader>/b", -- Toggle block comment
      },
      opleader = {
        line = "<leader>//", -- Line comment for operator-pending mode
        block = "<leader>/b", -- Block comment for operator-pending mode
      },
      extra = {
        above = "<leader>/O", -- Add comment on the line above
        below = "<leader>/o", -- Add comment on the line below
        eol = "<leader>/A", -- Add comment at the end of line
      },
    })
  end,
}
