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
					wezterm.action.SendKey({
						key = key,
						mods = mode == "resize" and "ALT" or "CTRL",
					}),
					pane
				)
			elseif mode == "resize" then
				window:perform_action(
					wezterm.action.AdjustPaneSize({
						directions[key],
						3,
					}),
					pane
				)
			else
				window:perform_action(wezterm.action.ActivatePaneDirection(directions[key]), pane)
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
			action = wezterm.action.SplitHorizontal({
				domain = "CurrentPaneDomain",
			}),
		},

		-- Split into top/bottom panes
		{
			key = "_",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({
				domain = "CurrentPaneDomain",
			}),
		},

		{
			key = "Z",
			mods = "CTRL|SHIFT",
			action = wezterm.action.TogglePaneZoomState,
		},

		-- Fuzzy find workspaces (tmux-session-like)
		{
			key = "W",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},

		-- Create a new named workspace (prompts for a name instead of
		-- leaving it as a random id)
		{
			key = "N",
			mods = "CTRL|SHIFT",
			action = wezterm.action.PromptInputLine({
				description = "Name for new workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line and line ~= "" then
						window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
					end
				end),
			}),
		},

		-- Rename the current workspace
		{
			key = "R",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				window:perform_action(
					wezterm.action.PromptInputLine({
						description = "New name for this workspace",
						initial_value = wezterm.mux.get_active_workspace(),
						action = wezterm.action_callback(function(_, _, line)
							if line and line ~= "" then
								wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
							end
						end),
					}),
					pane
				)
			end),
		},

		-- Kill the current workspace: closes every tab in every window
		-- that belongs to it (type "y" to confirm)
		{
			key = "K",
			mods = "CTRL|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				window:perform_action(
					wezterm.action.PromptInputLine({
						description = "Kill workspace '" .. wezterm.mux.get_active_workspace() .. "'? (y/n)",
						action = wezterm.action_callback(function(_, _, line)
							if line ~= "y" and line ~= "Y" then
								return
							end

							local mux = wezterm.mux
							local workspace = mux.get_active_workspace()

							for _, mux_win in ipairs(mux.all_windows()) do
								if mux_win:get_workspace() == workspace then
									local gui_win = mux_win:gui_window()
									for _, tab_info in ipairs(mux_win:tabs_with_info()) do
										gui_win:perform_action(
											wezterm.action.CloseCurrentTab({ confirm = false }),
											tab_info.tab:active_pane()
										)
									end
								end
							end
						end),
					}),
					pane
				)
			end),
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
