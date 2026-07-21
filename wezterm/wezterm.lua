local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Font and Color Scheme
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 18
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.9

-- Config for tab bar
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"


-- Config to split panes
config.keys = {
  -- Split into left/right panes
  {
    key = "|",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitHorizontal {
      domain = "CurrentPaneDomain",
    },
  },

  -- Split into top/bottom panes
  {
    key = "_",
    mods = "CMD",
    action = wezterm.action.SplitVertical {
      domain = "CurrentPaneDomain",
    },
  },


  {
    key = "h",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },

  {
    key = "h",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "j",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "k",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
  },
}

return config

