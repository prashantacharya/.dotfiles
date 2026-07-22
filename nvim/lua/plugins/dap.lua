return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
  },
  { "rcarriga/nvim-dap-ui", lazy = false },
  { "nvim-neotest/nvim-nio", lazy = false },
  { "theHamsta/nvim-dap-virtual-text", lazy = false },
  { "leoluz/nvim-dap-go", ft = { "go" } },
  { "mfussenegger/nvim-dap-python", ft = { "python" } },
}
