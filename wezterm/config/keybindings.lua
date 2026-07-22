local wezterm = require("wezterm")

local M = {}

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

function M.apply(config)
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
end

return M
