local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    python = { "ruff_format" },
    go = { "goimports", "gofumpt" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    lua = { "stylua" },
    -- rust: rustfmt via rust-analyzer/rustaceanvim (falls through to lsp_format below)
    -- zig: zig fmt via zls (falls through to lsp_format below)
  },
  format_on_save = function()
    return { timeout_ms = 2000, lsp_format = "fallback" }
  end,
})

vim.api.nvim_create_user_command("Format", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { range = true })

vim.keymap.set({ "n", "x" }, "<leader>fm", function()
  conform.format({ async = true, lsp_format = "fallback" })
end, { silent = true })

require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("UserLint", {}),
  callback = function()
    require("lint").try_lint()
  end,
})
