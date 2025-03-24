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
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
