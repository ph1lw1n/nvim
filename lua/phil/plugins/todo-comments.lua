-- Highlight todo, notes, etc in comments
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next [T]odo" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous [T]odo" })

    todo_comments.setup()
  end,
}
