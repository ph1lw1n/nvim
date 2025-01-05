-- set leader key
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- For conciseness
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Diagnostic keymaps
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "[Q]uickfix" })
-- Toggle diagnostics
local diagnostics_active = true
keymap.set("n", "<leader>xx", function()
  diagnostics_active = not diagnostics_active
  local bufnr = vim.api.nvim_get_current_buf() -- Get the current buffer
  if vim.api.nvim_buf_is_valid(bufnr) then
    if diagnostics_active then
      vim.diagnostic.enable(bufnr) -- Enable diagnostics for the current buffer
    else
      vim.diagnostic.disable(bufnr) -- Disable diagnostics for the current buffer
    end
  else
    print("Invalid buffer:", bufnr)
  end
end, { desc = "ON/OFF diagnostics" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("n", "s", "<Nop>", { noremap = true, silent = true }) -- deactivate s for mini-surround
keymap.set("x", "s", "<Nop>", { noremap = true, silent = true })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- window management / See `:help wincmd` for a list of all window commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- tab management
keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>", { desc = "[T]ab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "[x]Close" }) -- close current tab
keymap.set("n", "<leader>to", "<Cmd>tabonly<CR>", { desc = "Close [O]ther Tabs" }) -- Close all other tabs
keymap.set("n", "<Tab>", "<Cmd>tabnext<CR>") -- Go to next tab
keymap.set("n", "<S-Tab>", "<Cmd>tabprev<CR>") -- Go to previous tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "[N]ext" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "[P]revious" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "current buffer" }) --  move current buffer to new tab

---- Resize with arrows
keymap.set("n", "<Up>", ":resize -1<CR>", opts)
keymap.set("n", "<Down>", ":resize +3<CR>", opts)
keymap.set("n", "<Left>", ":vertical resize -1<CR>", opts)
keymap.set("n", "<Right>", ":vertical resize +3<CR>", opts)

-- split management
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "[S]plitsplit" }) -- split window vertically
keymap.set("n", "<leader>sd", "<C-w>s", { desc = "[D]ownsplit" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[E]qual" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "[x]Close" })
keymap.set("n", "<leader>sa", "<Cmd>only<CR>", { desc = "[A]ll close" })


-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
