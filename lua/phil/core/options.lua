vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
-- opt.relativenumber = true  -- INFO: uncomment for relative numbers

-- tabs & indentation
opt.tabstop = 2 -- 4 spaces for tabs
opt.shiftwidth = 2 -- 4 spaces for indent width
opt.softtabstop = 2
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- turn on termguicolors for tokyonight colorscheme to work
-- (only iterm2 || other true colour terminal)
opt.termguicolors = true
opt.background = "dark"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- **Filetype-specific settings**
-- Create a group for autocommands
local augroup = vim.api.nvim_create_augroup("FiletypeSettings", { clear = true })

-- Set tabstop=4 for C files
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = "c, cpp",
    callback = function()
        opt.expandtab = false     -- Use tabs, not spaces
        opt.tabstop = 4           -- Set tab width to 4
        opt.shiftwidth = 4        -- Set indent width to 4
        opt.softtabstop = 4       -- Backspace respects tab width
    end,
})
