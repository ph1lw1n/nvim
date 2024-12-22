return {
  "echasnovski/mini.nvim",
  version = false, -- Always use the latest version
  config = function()
    -- Mini Icons
    require("mini.icons").setup()

    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

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

    -- Nvim-web-devicons
    require("nvim-web-devicons").setup({ default = true })
  end,
}
