local wezterm = require("wezterm")

local M = {}

function M.apply(config)
  config.font = wezterm.font("FiraCode Nerd Font")
  config.font_size = 18
  config.color_scheme = "Tokyo Night"
  config.window_background_opacity = 0.95
  config.macos_window_background_blur = 50
end

return M
