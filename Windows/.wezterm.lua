-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	adjust_window_size_when_changing_font_size = false,
    color_scheme = 'Catppuccin Mocha',
	-- Font
	-- font = wezterm.font("JetBrainsMono Nerd Font Propo"),
	font = wezterm.font("iMWritingMono Nerd Font Propo"),
	font_size = 12,
	-- Shell
	default_prog = { "pwsh.exe", "-NoLogo" },
	-- Tab
	-- enable_tab_bar = false,
	-- use_fancy_tab_bar = false,
	-- tab_bar_at_bottom = true,
	--Cursor
	default_cursor_style = "SteadyBar",
	-- Window
	window_decorations = "RESIZE",
	window_background_opacity = 1,
	macos_window_background_blur = 10,
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	-- Hyperlink, from: https://akos.ma/blog/adopting-wezterm/
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			-- Before
			--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
			--format = '$0',
			-- After
			regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
			format = "$1",
			highlight = 1,
		},
		-- implicit mailto link
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
	},
}

return config
