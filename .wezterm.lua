-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "carbonfox"
config.font = wezterm.font("Iosevka")

--domain settings
config.unix_domains = {
	{
		name = "unix",
	},
}

--appearance settings
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
-- config.window_background_opacity = 0.95
config.window_padding = {
	bottom = 0,
}

-- config.colors = {
-- 	tab_bar = {
-- 		-- The color of the strip that goes along the top of the window
-- 		-- (does not apply when fancy tab bar is in use)
-- 		background = "#191724",
--
-- 		-- The active tab is the one that has focus in the window
-- 		active_tab = {
-- 			-- The color of the background area for the tab
-- 			bg_color = "#2b2042",
-- 			-- The color of the text for the tab
-- 			fg_color = "#c0c0c0",
--
-- 			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
-- 			-- label shown for this tab.
-- 			-- The default is "Normal"
-- 			intensity = "Normal",
--
-- 			-- Specify whether you want "None", "Single" or "Double" underline for
-- 			-- label shown for this tab.
-- 			-- The default is "None"
-- 			underline = "None",
--
-- 			-- Specify whether you want the text to be italic (true) or not (false)
-- 			-- for this tab.  The default is false.
-- 			italic = false,
--
-- 			-- Specify whether you want the text to be rendered with strikethrough (true)
-- 			-- or not for this tab.  The default is false.
-- 			strikethrough = false,
-- 		},
--
-- 		-- Inactive tabs are the tabs that do not have focus
-- 		inactive_tab = {
-- 			bg_color = "#1b1032",
-- 			fg_color = "#808080",
--
-- 			-- The same options that were listed under the `active_tab` section above
-- 			-- can also be used for `inactive_tab`.
-- 		},
--
-- 		-- You can configure some alternate styling when the mouse pointer
-- 		-- moves over inactive tabs
-- 		inactive_tab_hover = {
-- 			bg_color = "#3b3052",
-- 			fg_color = "#909090",
-- 			italic = true,
--
-- 			-- The same options that were listed under the `active_tab` section above
-- 			-- can also be used for `inactive_tab_hover`.
-- 		},
--
-- 		-- The new tab button that let you create new tabs
-- 		new_tab = {
-- 			bg_color = "#1b1032",
-- 			fg_color = "#808080",
--
-- 			-- The same options that were listed under the `active_tab` section above
-- 			-- can also be used for `new_tab`.
-- 		},
--
-- 		-- You can configure some alternate styling when the mouse pointer
-- 		-- moves over the new tab button
-- 		new_tab_hover = {
-- 			bg_color = "#3b3052",
-- 			fg_color = "#909090",
-- 			italic = true,
--
-- 			-- The same options that were listed under the `active_tab` section above
-- 			-- can also be used for `new_tab_hover`.
-- 		},
-- 	},
-- }
--
-- Leader is the same as my old tmux prefix
config.leader = { key = "b", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{ key = "l", mods = "SUPER", action = act.ActivateTabRelative(1) },
	{ key = "h", mods = "SUPER", action = act.ActivateTabRelative(-1) },
	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.ShowTabNavigator,
	},
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

-- Finally, return the configuration to wezterm:
return config
