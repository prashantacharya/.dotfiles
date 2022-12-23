require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "go", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    -- `false` will disable the whole extension
    enable = true,


    additional_vim_regex_highlighting = false,
  },
}
