return {
  "github/copilot.vim",
  event = "InsertEnter",
  keys = {
    {
      "<leader>c",
      function()
        -- Check the current status of Copilot
        local copilot_status = vim.fn["copilot#Enabled"]()

        if copilot_status == 1 then
          -- If Copilot is enabled, disable it
          vim.cmd("Copilot disable")
          print("Copilot: Disabled")
        else
          -- If Copilot is disabled, enable it
          vim.cmd("Copilot enable")
          print("Copilot: Enabled")
        end
      end,
      desc = "[C]opilot Toggle",
    },
  },
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap(
      "i",
      "<C-l>",
      'copilot#Accept("<CR>")',
      { silent = true, expr = true, script = true }
    )
    vim.api.nvim_set_keymap(
      "i",
      "<C-n>",
      "copilot#Next()",
      { silent = true, expr = true, script = true }
    )
    vim.api.nvim_set_keymap(
      "i",
      "<C-p>",
      "copilot#Previous()",
      { silent = true, expr = true, script = true }
    )
    vim.g.copilot_enabled = true
  end,
}
