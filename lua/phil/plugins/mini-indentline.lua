return {
  "echasnovski/mini.indentscope",
  version = false,
  config = function()
    -- Exclude specific filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "dashboard", "alpha", "help", "startify", "NvimTree", "Trouble" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    -- Set up mini.indentscope
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
  end,
}
