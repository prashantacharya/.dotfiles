return {
  "terrortylor/nvim-comment",
  keys = {
    { "<leader>cc", mode = { "n", "v" } },
    { "<leader>c", mode = { "n", "v" } },
  },
  config = function()
    require("nvim_comment").setup({
      line_mapping = "<leader>cc",
      operator_mapping = "<leader>c",
      comment_chunk_text_object = "ic",
    })
  end,
}
