return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use the `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Custom configurations go here
      keymaps = {
        insert = "<C-s>", -- Key for inserting surround in insert mode
        insert_line = "<C-S>", -- Key for inserting surround for the whole line in insert mode
        normal = "ys", -- Key for adding surround in normal mode
        normal_cur = "yss", -- Key for surrounding the current line
        delete = "ds", -- Key for deleting surround
        change = "cs", -- Key for changing surround
      },
      surrounds = {
        -- Add custom surrounds if needed
      },
    })
  end,
}

--[[
INFO:
The three core operations of add/delete/change:
 - ys{motion}{char}
 - ds{char}
 - cs{target}{replacement}
 - vS{char}

--[[
 HACK:
    Old text                    Command      New text
 --------------------------------------------------------------------
    surr*ound_words             ysiw)        (surround_words)
    *make strings               ys$"         "make strings"
    [delete ar*ound me!]        ds]          delete around me!
    remove <b>HTML t*ags</b>    dst          remove HTML tags
    'change quot*es'            cs'"         "change quotes"
    <b>or tag* types</b>        csth1<CR>    <h1>or tag types</h1>
    delete(functi*on calls)     dsf          function calls ]]
