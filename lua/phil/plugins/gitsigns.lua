-- Adds git related signs to the gutter
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "GitSigns stage buffer" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { desc = "GitSigns stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "GitSigns reset hunk" })
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "GitSigns stage hunk" })
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "GitSigns reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "GitSigns stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "GitSigns undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "GitSigns reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "GitSigns preview hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "GitSigns blame line" })
        map("n", "<leader>htb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "GitSigns diff this" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "GitSigns diff this" })
        map("n", "<leader>htd", gs.toggle_deleted, { desc = "GitSigns toggle deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
      end,
    })
  end,
}
