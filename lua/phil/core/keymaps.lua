-- Keymaps for better default experience

-- set leader key
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.keymap -- for conciseness

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = '[Q]uickfix List' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- window management / See `:help wincmd` for a list of all window commands
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- tab management
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "[O]pen" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[x]Close" }) -- close current tab
keymap.set("n", "<Tab>", "<Cmd>tabnext<CR>" )   -- Go to next tab
keymap.set("n", "<S-Tab>", "<Cmd>tabprev<CR>") -- Go to previous tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[N]ext" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[P]revious" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "current buffer" }) --  move current buffer to new tab

-- split management
keymap.set('n', '<leader>ss', '<C-w>v', { desc = "[S]plitsplit" })      -- split window vertically
keymap.set('n', '<leader>sd', '<C-w>s', { desc = "[D]ownsplit" })      -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = "[E]qual" })
keymap.set('n', '<leader>sx', ':close<CR>', { desc = "[x]Close" })
