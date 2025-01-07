return {
  "mfussenegger/nvim-dap",
  event = "CmdUndefined dap*", -- Load when any `dap` command is invoked
  dependencies = {
    -- Creates a beautiful Debugger UI
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio", -- Required dependency for dap-ui

    -- Mason and Debug Adapter Installers
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Specific language debuggers
    "julianolf/nvim-dap-lldb", -- C/C++
    -- "leoluz/nvim-dap-go",
    -- "mfussenegger/nvim-dap-python",
  },
  keys = {
    {
      "<leader>dd",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dap").continue()
      end,
      desc = "Start/Continue",
    },
    {
      "<leader>di",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dx",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>db",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        local cond = vim.fn.input("Breakpoint condition: ")
        require("dap").set_breakpoint(cond)
      end,
      desc = "Set Breakpoint (cond)",
    },
    {
      "<leader>du",
      function()
        require("lazy").load({ plugins = { "nvim-dap" } })
        require("dapui").toggle()
        vim.cmd("FocusToggle")
      end,
      desc = "Toggle UI",
    },
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
        -- "gdb", -- C/C++
        -- "lldb-vscode", -- C/C++
        -- "gopls", -- Go
        -- "debugpy", -- Python
        -- Add more debuggers here
      },
    })

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
