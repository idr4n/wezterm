local wezterm = require("wezterm")

-- Colors customization
-- customize zenbones_dark's background
local schemeZenbonesDark = wezterm.get_builtin_color_schemes()["zenbones_dark"]
schemeZenbonesDark.background = "#171210"
-- customize zenbones_light's background
local schemeZenbonesLight = wezterm.get_builtin_color_schemes()["zenbones_light"]
schemeZenbonesLight.background = "#F8F6F5"
schemeZenbonesLight.cursor_bg = "#9775FA"
-- customize tokyonight
local schemeTokyoNight = wezterm.get_builtin_color_schemes()["tokyonight"]
schemeTokyoNight.split = "#000000"
-- customize Sonokai
local schemeSonokai = wezterm.get_builtin_color_schemes()["Sonokai (Gogh)"]
schemeSonokai.cursor_fg = "#2C2E34"
-- customize Catppuccin
local catppuccinMacchiato = wezterm.get_builtin_color_schemes()["Catppuccin Macchiato"]
catppuccinMacchiato.split = "#000000"
catppuccinMacchiato.tab_bar.background = catppuccinMacchiato.background
catppuccinMacchiato.tab_bar.inactive_tab.bg_color = catppuccinMacchiato.background
catppuccinMacchiato.tab_bar.inactive_tab.fg_color = catppuccinMacchiato.brights[8]
catppuccinMacchiato.tab_bar.active_tab.bg_color = catppuccinMacchiato.background
catppuccinMacchiato.tab_bar.active_tab.fg_color = catppuccinMacchiato.ansi[6]
catppuccinMacchiato.tab_bar.active_tab.intensity = "Bold"
local catppuccinFrappe = wezterm.get_builtin_color_schemes()["Catppuccin Frappe"]
catppuccinFrappe.split = "#000000"
catppuccinFrappe.tab_bar.background = catppuccinFrappe.background
catppuccinFrappe.tab_bar.inactive_tab.bg_color = catppuccinFrappe.background
catppuccinFrappe.tab_bar.inactive_tab.fg_color = catppuccinFrappe.brights[8]
catppuccinFrappe.tab_bar.active_tab.bg_color = catppuccinFrappe.background
catppuccinFrappe.tab_bar.active_tab.fg_color = catppuccinFrappe.ansi[6]
catppuccinFrappe.tab_bar.active_tab.intensity = "Bold"

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "zenbones_dark custom"
		-- return "tokyonight custom"
		-- return "tokyonight-storm"
		return "tokyonight-moon"
		-- return "kanagawabones"
		-- return "duskfox"
		-- return "nordfox"
		-- return "Rosé Pine (base16)"
		-- return "Rosé Pine Moon (base16)"
		-- return "Catppuccin Macchiato"
		-- return "Catppuccin Frappe"
		-- return "sonokai custom"
	else
		-- return "zenbones_light custom"
		-- return "dawnfox"
		-- return "nordfox"
		-- return "tokyonight custom"
		-- return "tokyonight-storm"
		return "tokyonight-moon"
		-- return "kanagawabones"
		-- return "Rosé Pine Moon (base16)"
		-- return "Rosé Pine Dawn (base16)"
		-- return "Catppuccin Frappe"
		-- return "Catppuccin Macchiato"
		-- return "sonokai custom"
	end
end

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = { name, "Noto Color Emoji", "JetBrains Mono" }
	return wezterm.font_with_fallback(names, params)
end

return {
	-- window config
	window_decorations = "RESIZE",
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	enable_scroll_bar = false,
	window_padding = {
		left = 0,
		right = 0,
		top = "0.2cell",
		bottom = 0,
	},
	initial_rows = 26,
	initial_cols = 110,
	-- window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.98,
	-- window_background_opacity = 0.90,
	inactive_pane_hsb = {}, -- don't dim inactive panes
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	cursor_blink_rate = 0,

	-- Font config
	cursor_thickness = 3,
	font_size = 16,
	-- this is for FiraCode
	line_height = 1.18,
	-- this is for Monolisa
	-- line_height = 1.05,
	term = "wezterm",
	-- font = wezterm.font("Monolisa Custom"),
	-- font = wezterm.font("Monolisa Custom", { weight = "Light" }),
	-- font = wezterm.font_with_fallback({ { family = "Monolisa Custom", weight = "Light" }, "nonicons" }),
	-- font = wezterm.font_with_fallback({
	-- 	{ family = "Monolisa Custom", weight = "Light" },
	-- 	{ family = "Symbols Nerd Font Mono", scale = 0.8 },
	-- }),
	-- For Fira Code it is needed to set a rule so Wezterm does not use JetBrains Mono italics
	font = font_with_fallback("FiraCode Nerd Font", { weight = "Light" }),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback("FiraCode Nerd Font", { weight = "Light" }),
		},
	},
	harfbuzz_features = { "zero", "ss04", "cv16", "cv14", "calt=0", "clig=0", "liga=0" },
	-- harfbuzz_features = { "zero", "ss04", "cv16", "cv14" },

	-- key bindings
	keys = require("wezterm_keys"),

	-- color schemes
	color_schemes = {
		-- Override the builtin zenbones_dark scheme with our modification above.
		["zenbones_dark custom"] = schemeZenbonesDark,
		["zenbones_light custom"] = schemeZenbonesLight,
		["Catppuccin Macchiato"] = catppuccinMacchiato,
		["Catppuccin Frappe"] = catppuccinFrappe,
		["tokyonight custom"] = schemeTokyoNight,
		["sonokai custom"] = schemeSonokai,
	},
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
