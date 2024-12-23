-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = "BufReadPre",
  config = function()
    require("conform").setup({

      formatters_by_ft = {
        lua = { "stylua" },
        -- python = { "black" },
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

    -- Filetype-specific keymap for formatting C files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "make" },
      callback = function()
        vim.keymap.set("n", "<Leader>F", "gg=G", { desc = "[F]ormat", buffer = true })
      end,
    })

    -- -- Custom command for clang-format (need to create .clang-format file in nvim directory)
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = { "c", "cpp" },
    --   callback = function()
    --     vim.keymap.set("n", "<Leader>F", function()
    --       require("conform").format({
    --         lsp_fallback = false,
    --         extra_args = {
    --           "--style=file",
    --           "--assume-filename=" .. vim.fn.stdpath("config") .. "/.clang-format",
    --         },
    --       })
    --     end, { desc = "[F]ormat C/C++ with custom .clang-format", buffer = true })
    --   end,
    -- })

    -- Global keymap for all other filetypes
    vim.keymap.set("n", "<Leader>F", function()
      require("conform").format({
        async = true, -- optional, if you want async formatting
      })
    end, { noremap = true, silent = true, desc = "[F]ormat" })
  end,
}
