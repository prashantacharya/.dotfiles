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
            "javascript", "typescript", "javascriptreact", "typescriptreact",
            "html", "css", "scss", "json", "yaml", "markdown",
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
        null_ls.builtins.formatting.lua_format,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

          vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end
    })
  end,
}
