return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  },
  { "mason-org/mason.nvim", lazy = false },
  { "mason-org/mason-lspconfig.nvim", lazy = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = false },

  -- Rust LSP + DAP, managed separately from mason-lspconfig
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
  },
}
