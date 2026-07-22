local dap = require("dap")
local dapui = require("dapui")

-- mason.nvim prepends its bin dir to $PATH, so mason-installed adapter
-- shims (codelldb, dlv, debugpy) are resolvable by name below.

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

local codelldb_launch = {
  name = "Launch file",
  type = "codelldb",
  request = "launch",
  program = function()
    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  end,
  cwd = "${workspaceFolder}",
  stopOnEntry = false,
}

dap.configurations.c = { codelldb_launch }
dap.configurations.cpp = { codelldb_launch }
dap.configurations.zig = { codelldb_launch }

require("dap-go").setup()
require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local keyset = vim.keymap.set

keyset("n", "<F5>", dap.continue, { silent = true })
keyset("n", "<F10>", dap.step_over, { silent = true })
keyset("n", "<F11>", dap.step_into, { silent = true })
keyset("n", "<F12>", dap.step_out, { silent = true })
keyset("n", "<leader>b", dap.toggle_breakpoint, { silent = true })
keyset("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { silent = true })
keyset("n", "<leader>du", dapui.toggle, { silent = true })
keyset("n", "<leader>dr", dap.repl.open, { silent = true })
