return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope", -- Lazy load on :Telescope command
  keys = {
    { "<leader>ff", function() require("telescope.builtin").git_files() end, desc = "Telescope Git Files" },
    { "<C-p>", function() require("telescope.builtin").find_files() end, desc = "Telescope Find Files" },
    { "<C-f>", function() require("telescope.builtin").live_grep() end, desc = "Telescope Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Telescope Buffers" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
    })
  end,
}

