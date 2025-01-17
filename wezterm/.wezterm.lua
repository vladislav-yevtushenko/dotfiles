local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.check_for_updates = true
config.term = "xterm-256color"
config.use_ime = true
config.color_scheme = "Tokyo Night Storm (Gogh)"
config.font_size = 14.0
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}
config.pane_select_font_size = 36
config.default_gui_startup_args = { "connect", "unix" }
config.leader = {
	key = "b",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}
config.keys = {
	-- Pane splitting (tmux-like)
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "%", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Pane resizing using arrow keys
	{ key = "LeftArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },

	-- Pane navigation
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "o", mods = "LEADER", action = act.ActivatePaneDirection("Next") }, -- Move to the next pane
	{ key = ";", mods = "LEADER", action = act.ActivatePaneDirection("Prev") }, -- Move to the previous pane

	{ key = "Tab", mods = "LEADER", action = act.PaneSelect },

	-- Show all windows (tabs)
	{ key = "w", mods = "LEADER", action = act.ShowTabNavigator },
	-- Pane zoom
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- Tabs (equivalent to tmux windows)
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },

	-- Copy mode
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },

	-- Search within scrollback
	{ key = "f", mods = "LEADER", action = act.Search({ CaseInSensitiveString = "" }) },

	-- Close pane
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- Restart wezterm
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },
}

config.colors = {
	tab_bar = {
		active_tab = {
			fg_color = "#073642",
			bg_color = "#6699CC",
			intensity = "Normal",
		},
		inactive_tab = {
			bg_color = "#1a1b26",
			fg_color = "#4c566a",
		},
	},
}

config.unix_domains = {
	{
		name = "unix",
	},
}
config.ssh_domains = {
	{
		name = "pve",
		remote_address = "pve.pikahome",
		username = "root",
		ssh_option = {
			identityfile = "~/.ssh/id_rsa",
		},
	},
}
wezterm.on("gui-startup", function(window)
	window:maximize()
end)

return config
