return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- Integration with LSP
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Automatic tool installer
  },
  config = function()
    -- Import Mason and related plugins
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Mason setup: Configure UI
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      max_concurrent_installers = 10, -- Allow multiple installations at once
    })

    -- Mason LSPConfig setup: Install and configure LSP servers
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd", -- C/C++
        "pyright", -- Python
        "lua_ls", -- Lua
        "bashls", -- Bash
        "jsonls", -- JSON
        "yamlls", -- YAML
        "dockerls", -- Docker
        "cssls", -- CSS
        "html", -- HTML
        -- "tsserver", -- Typescript / JaveScript
        -- Add other servers as needed
      },
    })

    -- Mason Tool Installer setup: Install formatters, linters, and other tools
    mason_tool_installer.setup({
      ensure_installed = {
        -- C/C++ tools
        "clang-format", -- Formatter
        "cpplint", -- c/c++

        -- Python tools
        "black", -- Formatter
        "isort", -- import sorter
        "pylint", -- Linter

        -- Lua tools
        "stylua", -- Formatter
        "luacheck", -- Linter

        -- Shell
        "bash-language-server", -- LSP
        "shfmt", -- Formatter

        -- Web Development
        -- "prettier", -- Formatter
        -- "eslint_d", -- Linter

        -- Add other tools as needed
      },
    })
  end,
}
