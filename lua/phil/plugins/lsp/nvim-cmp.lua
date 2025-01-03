return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- follow the latest release
      build = "make install_jsregexp", -- install jsregexp (optional)
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- Load vscode-style snippets from installed plugins (e.g., friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Access tokyonight's color palette
    local colors = require("tokyonight.colors").setup()

    -- Use colors from the palette
    vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg, fg = colors.fg, blend = 20 })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.bg_highlight, fg = colors.fg })
    vim.api.nvim_set_hl(0, "PmenuBorder", { fg = colors.border })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg_float, blend = 20 })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.border })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<c-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<c-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<c-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up in documentation
        ["<c-f>"] = cmp.mapping.scroll_docs(4), -- scroll down in documentation
        ["<c-space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<c-e>"] = cmp.mapping.abort(), -- close completion window
        ["<cr>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
        -- ["<tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<s-tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.locally_jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- language server protocol
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within the current buffer
        { name = "path" }, -- file system paths
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...", -- ellipsis for truncated text
        }),
      },
    })
  end,
}
