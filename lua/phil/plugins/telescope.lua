-- Fuzzy Finder (files, lsp, etc)
return {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        "folke/todo-comments.nvim",
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
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")

        -- Set keymaps
        local keymap = vim.keymap
        local builtin = require("telescope.builtin")

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[F]ind [r]ecent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind [s]tring in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind string under [c]ursor in cwd" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "[F]ind [t]odos" })
        keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" })

        keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, })
        end, { desc = '[/] Fuzzily search in current buffer' })

        keymap.set('n', '<leader>f/', function()
            builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', }
        end, { desc = '[F]ind [/] in Open Files' })

        keymap.set('n', '<leader>fn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[F]ind [N]eovim files' })
    end,
}
