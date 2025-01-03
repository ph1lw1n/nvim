return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Creates a beautiful Debugger UI
    "rcarriga/nvim-dap-ui",
    'nvim-neotest/nvim-nio', -- Required dependency for dap-ui

    -- Mason and Debug Adapter Installers
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Specific language debuggers
    "julianolf/nvim-dap-lldb", -- C/C++
    -- "leoluz/nvim-dap-go",
    -- "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Mason DAP setup
    require("mason-nvim-dap").setup({
      automatic_setup = true,
      automatic_installation = true,
      ensure_installed = {
        "codelldb", -- C/C++
        "gdb", -- C/C++
        -- "lldb-vscode", -- C/C++
        -- "gopls", -- Go
        -- "debugpy", -- Python
        -- Add more debuggers here
      },
    })

    -- Debugger keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Breakpoint" })
    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: Toggle Debugger UI" })

    -- DAP UI setup
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    -- Auto open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Language-specific setup
    require("dap-lldb").setup()
    -- require('dap-go').setup()
    -- require("dap-python").setup()
  end,
}
