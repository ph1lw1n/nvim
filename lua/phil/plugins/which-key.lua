return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 -- Adjust popup delay to 500ms
  end,
  opts = {
    plugins = {
      presets = {
        operators = false, -- Disable operator-pending mappings like `d` or `y`
        motions = false,   -- Disable motion mappings like `g`
        text_objects = false, -- Disable text object mappings like `a{`
      },
    },
    icons = {
      breadcrumb = '»', -- Use mini.icons equivalent or fallback
      separator = '→',  -- Use mini.icons equivalent or fallback
      group = '+',      -- Use mini.icons equivalent or fallback
    },

--    check_mappings = false, -- Suppress health check warnings

    -- Document existing key chains
    spec = {
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>s', group = '[S]plits' },
      { '<leader>g', group = '[G]it' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>t', group = '[T]abs' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>x', group = '[Trouble]' },
      { '<leader>w', group = '[W]orkspace' },
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)

    -- Register leader mappings based on the spec
    wk.add (opts.spec, { prefix = '<leader>' })
  end,
}
