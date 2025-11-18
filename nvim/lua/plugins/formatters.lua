return {
  "nvimtools/none-ls.nvim",

  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Python
        null_ls.builtins.formatting.black,

        -- JavaScript / TypeScript / HTML / CSS / JSON / Markdown
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "html",
            "css",
            "scss",
            "json",
            "yaml",
            "markdown",
          },
        }),

        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,

        -- Optional: Organize imports
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,

        -- Lua
        null_ls.builtins.formatting.stylua,
      },
    })

    -- Setup formatting on save for none-ls
    local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = 0, async = false })
      end,
    })
  end,
}
