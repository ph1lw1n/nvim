-- lua/plugins/nvim-lint.lua
return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  config = function()
    require("lint").linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8" },
      -- javascript = { "eslint" },
      -- typescript = { "eslint" },
      c = { "cpplint" }, -- Use cpplint for C
      cpp = { "cpplint" }, -- Use cpplint for C++
    }

    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
