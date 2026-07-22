return {
  -- Core / LSP (coc)
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    build = "npm install --frozen-lockfile || npm install",
  },

  -- Colorscheme (after/plugin/colors.lua)
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Treesitter stack (after/plugin/treesitter*.lua, autotag.lua)
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "windwp/nvim-ts-autotag",
    },
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = false },
  { "windwp/nvim-ts-autotag", lazy = false },

  -- Editor UI
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "nvim-tree/nvim-tree.lua", lazy = false },
  { "nvim-lualine/lualine.nvim", lazy = false },
  { "feline-nvim/feline.nvim", lazy = false },
  { "lukas-reineke/indent-blankline.nvim", lazy = false },

  -- Editing
  { "windwp/nvim-autopairs", lazy = false },
  { "terrortylor/nvim-comment", lazy = false },

  -- Git
  { "lewis6991/gitsigns.nvim", lazy = false },
  { "sindrets/diffview.nvim", lazy = false, dependencies = { "nvim-lua/plenary.nvim" } },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- AI completion
  { "supermaven-inc/supermaven-nvim", lazy = false },

  -- Utilities
  { "mbbill/undotree", lazy = false },

  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      local smart_splits = require("smart-splits")

      smart_splits.setup({
        multiplexer_integration = "wezterm",
      })

      -- Navigate
      vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
      vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
      vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
      vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)

      -- Resize
      vim.keymap.set("n", "<A-h>", smart_splits.resize_left)
      vim.keymap.set("n", "<A-j>", smart_splits.resize_down)
      vim.keymap.set("n", "<A-k>", smart_splits.resize_up)
      vim.keymap.set("n", "<A-l>", smart_splits.resize_right)
    end,
  }
}
