-- Must be set before the ft=rust plugin initializes
vim.g.rustaceanvim = {
  server = {
    settings = {
      ["rust-analyzer"] = {
        check = { command = "clippy" },
      },
    },
  },
}
