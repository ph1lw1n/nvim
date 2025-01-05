return {
  "kevinhwang91/nvim-ufo",
  event = "BufReadPre",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    vim.o.foldcolumn = "0" -- Show fold column
    vim.o.foldlevel = 99 -- Keep all folds open initially
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek Fold" })

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Return exactly two providers: "lsp" as the main provider, "indent" as the fallback
        return { "lsp", "indent" }
      end,
    })
  end,
}
