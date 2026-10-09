vim.cmd[[colorscheme tokyonight-night]]

local function toggle_theme()
  if vim.g.colors_name == "tokyonight-night" then
    vim.cmd("colorscheme tokyonight-day")
  else
    vim.cmd("colorscheme tokyonight-night")
  end
end

vim.keymap.set("n", "<leader>tt", toggle_theme, { desc = "Toggle light/dark theme" })
