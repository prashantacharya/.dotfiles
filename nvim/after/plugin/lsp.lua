require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "basedpyright",
    "ruff",
    "gopls",
    "vtsls",
    "zls",
    "lua_ls",
  },
  -- Whitelist, not just exclude: mason-tool-installer also installs formatters/DAP
  -- adapters (e.g. stylua) that happen to have their own nvim-lspconfig entries
  -- (stylua ships a `--lsp` mode); automatic_enable would pick those up too if left
  -- unrestricted. rust_analyzer is deliberately omitted since rustaceanvim owns it.
  automatic_enable = { "clangd", "basedpyright", "ruff", "gopls", "vtsls", "zls", "lua_ls" },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    -- formatters
    "clang-format",
    "gofumpt",
    "goimports",
    "prettierd",
    "stylua",
    -- linters
    "eslint_d",
    -- dap adapters
    "codelldb",
    "delve",
    "debugpy",
    -- rust-analyzer binary (rustaceanvim points at mason's install, not lspconfig)
    "rust-analyzer",
  },
})

vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = { gofumpt = true },
  },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local keyset = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", {}),
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    keyset("n", "gd", vim.lsp.buf.definition, opts)
    keyset("n", "gy", vim.lsp.buf.type_definition, opts)
    keyset("n", "gi", vim.lsp.buf.implementation, opts)
    keyset("n", "gr", vim.lsp.buf.references, opts)
    keyset("n", "<leader>d", vim.lsp.buf.hover, opts)
    keyset("n", "<F2>", vim.lsp.buf.rename, opts)
    keyset("n", "<leader>ac", vim.lsp.buf.code_action, opts)
    keyset({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, opts)
    keyset("n", "[g", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    keyset("n", "]g", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    keyset("n", "<space>a", vim.diagnostic.setloclist, opts)
  end,
})
