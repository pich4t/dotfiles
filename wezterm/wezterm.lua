local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- フリッカー対策
config.front_end = "OpenGL"

-- UDEV Gothic 35NF: JetBrains Mono + BIZ UDゴシック (Nerd Font)
config.font = wezterm.font("UDEV Gothic 35NF")
config.font_size = 20

-- config.harfbuzz_features = {
--     "calt=0", "clig=0", "liga=0", -- no ligatures
--     "zero", -- slash zero
--     "cv01", -- l tail
--     "cv07", -- w middle connection
--     "cv11", -- y tail
--     "cv12", -- u tail
-- }

config.use_ime = true
config.color_scheme = "MaterialDesignColors"
--config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.7
--config.macos_window_background_blur = 20

-- corsor setting
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = "8pt"

-- tab setting
config.window_frame = {
	font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font_size = 14,
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}
config.window_background_gradient = {
	colors = { "#000000" },
}
config.colors = {
	tab_bar = { inactive_tab_edge = "none" },
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_lower_left_triangle
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#FFFFFF"
	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#FFFFFF"
	end
	local edge_background = "none"
	local edge_foreground = background
	local title = "    " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "    "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },

		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },

		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

-- Key Binds
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
--config.key_tables = require("keybinds").key_tables
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
return config
