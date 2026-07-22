local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("config.general").apply(config)
require("config.tabline").apply(config)
require("config.keybindings").apply(config)

return config
