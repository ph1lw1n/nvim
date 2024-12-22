-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    { "nvim-telescope/telescope-ui-select.nvim" },
    "folke/todo-comments.nvim",
    { "BurntSushi/ripgrep", description = "Install ripgrep (system binary)" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble_ok, trouble = pcall(require, "trouble")
    local trouble_telescope = trouble_ok and require("trouble.sources.telescope") or nil

    local custom_actions = transform_mod({
      open_trouble_qflist = function(prompt_bufnr)
        if trouble_ok then
          trouble.toggle("quickfix")
        end
      end,
    })

    telescope.setup({
      defaults = {
        winblend = 10,
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- Move to previous result
            ["<C-j>"] = actions.move_selection_next, -- Move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope and trouble_telescope.open or nil,
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    -- Set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles in cwd" })
    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[R]ecent" })
    keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[S]tring in cwd" })
    keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "string under [C]ursor in cwd" })
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[T]odos" })
    keymap.set("n", "<leader>fa", function()
      require("telescope.builtin").buffers({
        previewer = false,
      })
    end, { desc = "[A]ll Buffers" })

    keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ previewer = false }))
    end, { desc = "Find in Buffer" })

    keymap.set("n", "<leader>f/", function()
      builtin.live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
    end, { desc = "Grep in Open Files" })

    keymap.set("n", "<leader>fn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[N]eovim files" })
  end,
}
