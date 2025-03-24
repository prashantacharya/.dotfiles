return {"nvim-treesitter/nvim-treesitter", 
    ensure_installed = { 
      "typescript",
      "javascript",
      "lua",
      "json",
      "bash",
      "markdown",
      "tsx",
      "go",
      "python"
    }, 
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = false,
    },
  }
