-- This file handles the setup and configuration of installed LSP servers.
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP.
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- KEYBINDS
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration in vertical split"
        keymap.set("n", "gD", function()
          vim.cmd("vsplit")
          vim.lsp.buf.declaration()
        end, opts)

        opts.desc = "Go to definition in vertical split"
        keymap.set("n", "gd", function()
          vim.cmd("vsplit")
          vim.lsp.buf.definition()
        end, opts)

        -- opts.desc = "Go to declaration"
        -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) --This is not Goto Definition, this is Goto Declaration. In C this would take you to the header.
        -- opts.desc = "Show LSP definitions"
        -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        -- opts.desc = "Show LSP type definitions"
        -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        -- opts.desc = "See available code actions"
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)  -- usually your cursor needs to be on top of an error or a suggestion from your LSP for this to activate.

        opts.desc = "Smart [r]ename"
        keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts) -- smart rename

        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        -- opts.desc = "Show line diagnostics"
        -- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Previous [D]iagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Next [D]iagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        -- opts.desc = "Restart LSP"
        -- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Enable autocompletion for all LSP servers
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Setup handlers for LSP servers:
    mason_lspconfig.setup_handlers({
      -- Default handler for servers without specific configs:
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -- Specific handler for clangd
      ["clangd"] = function()
        lspconfig["clangd"].setup({
          cmd = { "clangd", "--offset-encoding=utf-8", "--background-index" },
          capabilities = capabilities,
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
        })
      end,

      -- -- Specific handler for pyright
      -- ["pyright"] = function()
      --   lspconfig["pyright"].setup({
      --     capabilities = capabilities,
      --     settings = {
      --       python = {
      --         analysis = {
      --           typeCheckingMode = "basic", -- Optional: Adjust type checking
      --         },
      --       },
      --     },
      --   })
      -- end,

      -- Specific handler for lua
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Add Neovim runtime as library
              },
            },
          },
        })
      end,
    })
  end,
}
