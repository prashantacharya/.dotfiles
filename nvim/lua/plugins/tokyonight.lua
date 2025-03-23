return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load this plugin immediately
  priority = 1000, -- Load this plugin first
  config = function()
    vim.cmd("colorscheme tokyonight")
  end,
}
