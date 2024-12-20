-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    require("conform").setup({

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        -- javascript = { "prettier" },
        -- typescript = { "prettier" },

        --  C and C++
        -- c = { "clang-format" },
        -- cpp = { "clang-format" },
      },

      -- Format on save:
      -- format_on_save = {
      --   timeout_ms = 1000,
      --   lsp_fallback = true,
      -- },
    })
    -- Set keymap for formatting
    vim.keymap.set("n", "<leader>F", function()
      require("conform").format({
        async = true, -- optional, if you want async formatting
      })
    end, { noremap = true, silent = true, desc = "[F]ormat" })
  end,
}
