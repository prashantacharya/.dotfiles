local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Font and Color Scheme
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 18
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 50

-- Config for tab bar
-- Tmux-style statusline
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 32


config.colors = {
  tab_bar = {
    background = "rgba(0, 0, 0, 0.0)",

    active_tab = {
      bg_color = "#7aa2f7",
      fg_color = "#1a1b26",
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "rgba(0, 0, 0, 0.0)",
      fg_color = "#a9b1d6",
    },

    inactive_tab_hover = {
      bg_color = "#292e42",
      fg_color = "#c0caf5",
    },
  },
}

local function basename(path)
  if not path then
    return nil
  end

  path = path:gsub("/$", "")
  return path:match("([^/]+)$")
end

wezterm.on("format-tab-title", function(tab)
  local pane = tab.active_pane
  local process = basename(pane.foreground_process_name)
  local title = pane.title
  local index = tab.tab_index + 1

  local shells = {
    zsh = true,
    bash = true,
    fish = true,
    nu = true,
  }

  if process and shells[process] then
    local cwd = pane.current_working_dir

    if cwd then
      title = basename(cwd.file_path or tostring(cwd)) or "shell"
    else
      title = "shell"
    end
  elseif process then
    title = process
  end

  return {
    {
      Text = string.format(" %d:%s ", index, title),
    },
  }
end)


wezterm.on("update-status", function(window, pane)
  local cwd = pane:get_current_working_dir()
  local cwd_text = ""

  if cwd then
    cwd_text = cwd.file_path or tostring(cwd)
    cwd_text = cwd_text:match("([^/]+)/*$") or cwd_text
  end

  local date = wezterm.strftime("%a %H:%M")

  window:set_right_status(
    wezterm.format({
      { Text = string.format(" %s | %s ", cwd_text, date) },
    })
  )
end)

-- Move between panes and resize
-- seemlessly with smart-splits.nvim
local function is_nvim(pane)
  return pane:get_user_vars().IS_NVIM == "true"
end


local directions = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function split_nav(mode, key)
  return {
    key = key,
    mods = mode == "resize" and "ALT" or "CTRL",

    action = wezterm.action_callback(function(window, pane)
      if is_nvim(pane) then
        -- Let smart-splits.nvim handle the key.
        window:perform_action(
          wezterm.action.SendKey {
            key = key,
            mods = mode == "resize" and "ALT" or "CTRL",
          },
          pane
        )
      elseif mode == "resize" then
        window:perform_action(
          wezterm.action.AdjustPaneSize {
            directions[key],
            3,
          },
          pane
        )
      else
        window:perform_action(
          wezterm.action.ActivatePaneDirection(directions[key]),
          pane
        )
      end
    end),
  }
end

-- Config to split panes
config.keys = {
  -- Split into left/right panes
  {
    key = "|",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal {
      domain = "CurrentPaneDomain",
    },
  },

  -- Split into top/bottom panes
  {
    key = "_",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical {
      domain = "CurrentPaneDomain",
    },
  },

  -- Move between panes
  split_nav("move", "h"),
  split_nav("move", "j"),
  split_nav("move", "k"),
  split_nav("move", "l"),

  -- Seamless Neovim/WezTerm resizing
  split_nav("resize", "h"),
  split_nav("resize", "j"),
  split_nav("resize", "k"),
  split_nav("resize", "l"),
}

return config

