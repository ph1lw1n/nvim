return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "ObsidianVault",
          path = "/Users/philwin/Documents/ObsidianVault",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "notes_subdir",
      note_id_func = function(title)
        return title
      end,
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      mappings = {
        -- Obsidian
        vim.keymap.set(
          "n",
          "<leader>oc",
          "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
          { desc = "Obsidian Check Checkbox" }
        ),
        vim.keymap.set(
          "n",
          "<leader>ot",
          "<cmd>ObsidianTemplate<CR>",
          { desc = "Insert Obsidian Template" }
        ),
        vim.keymap.set(
          "n",
          "<leader>oo",
          "<cmd>ObsidianOpen<CR>",
          { desc = "Open in Obsidian App" }
        ),
        vim.keymap.set(
          "n",
          "<leader>ob",
          "<cmd>ObsidianBacklinks<CR>",
          { desc = "Show ObsidianBacklinks" }
        ),
        vim.keymap.set(
          "n",
          "<leader>ol",
          "<cmd>ObsidianLinks<CR>",
          { desc = "Show ObsidianLinks" }
        ),
        vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" }),
        vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" }),
        vim.keymap.set(
          "n",
          "<leader>oq",
          "<cmd>ObsidianQuickSwitch<CR>",
          { desc = "Quick Switch" }
        ),
      },

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        tags = "",
        substitutions = {
          yesterday = function()
            return os.date("%Y-%m-%d", os.time() - 86400)
          end,
          tomorrow = function()
            return os.date("%Y-%m-%d", os.time() + 86400)
          end,
        },
      },

      ui = {
        enable = false, -- using render-markdown.nvim instead
      },
    })
  end,
}
