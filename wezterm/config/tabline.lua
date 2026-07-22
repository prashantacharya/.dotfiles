local wezterm = require("wezterm")

local M = {}

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

function M.apply(config)
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
end

return M
