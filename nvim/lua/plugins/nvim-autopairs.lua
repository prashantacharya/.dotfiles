return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Lazy load on insert
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })
  end,
}
