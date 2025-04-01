return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "typescript",
        "javascript",
        "go",
        "markdown",
        "json",
        "python",
        "lua",
        "c",
        "cpp",
        "rust",
        "vimdoc",
        "tsx",
        "html",
        "css",
        "scss",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
