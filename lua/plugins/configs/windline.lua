local startup_utils = require("utils.startup")
local windline = require("windline")
local state = _G.WindLine.state
local lsp_comps = require("windline.components.lsp")
local basic_components = require("windline.components.basic")
local diagnostics_utils = require("utils.diagnostics")

local MIN_WIDTH = 100
local NORMAL_HIGHLIGHT = { "white", "PrimaryColor" }

local lsp_diagnos = {
	name = "diagnostic",
	hl_colors = {
		red = { "red", "PrimaryColor" },
		yellow = { "yellow", "PrimaryColor" },
		white = { "white", "PrimaryColor" },
	},
	text = function(bufnr)
		lsp_comps.check_lsp(bufnr)

		return {
			{ lsp_comps.lsp_error({ format = "  %s", show_zero = true }), "red" },
			{ lsp_comps.lsp_warning({ format = "  %s", show_zero = true }), "yellow" },
			{ lsp_comps.lsp_hint({ format = " 󰌵 %s", show_zero = true }), "white" },
		}
	end,
}

local formatter = {
	hl_colors = {
		yellow_face = { "yellow", "PrimaryColor" },
	},
	text = function(bufnr)
		local err_count = diagnostics_utils.get_diagnostics_count(bufnr)
		local icon = err_count == 0 and "󰱫 " or "󰱶 "

		return {
			{ icon, "yellow_face" },
			{ "Formatter", NORMAL_HIGHLIGHT },
		}
	end,
}

local vi_mode = {
	name = "vi_mode",
	hl_colors = {
		Normal = { "black", "green", "bold" },
		Insert = { "black", "yellow", "bold" },
		Visual = { "black", "blue_light", "bold" },
		Replace = { "black", "pink", "bold" },
		Command = { "black", "magenta", "bold" },
		NormalBefore = { "green", "black" },

		VisualBefore = { "blue_light", "black" },
		ReplaceBefore = { "pink", "black" },
		CommandBefore = { "magenta", "black" },
		NormalAfter = { "white", "green" },
		InsertAfter = { "white", "yellow" },
		VisualAfter = { "white", "blue_light" },
		ReplaceAfter = { "white", "pink" },
		CommandAfter = { "white", "magenta" },
	},
	text = function()
		return { { " " .. state.mode[1] .. " ", state.mode[2] } }
	end,
}

local space = { " ", { "PrimaryColor", "PrimaryColor" } }

local battery_icons = {
	["0"] = "",
	["25"] = "",
	["50"] = "",
	["75"] = "",
	["100"] = "",
}

local function format_progress_as_battery(current_progress)
	return battery_icons[tostring(math.ceil(current_progress / 25) * 25)]
end

local function get_parsed_progress(is_global)
	-- if is_global == nil then
	-- 	return progress_state.progress
	-- end

	return math.floor(vim.fn.line(".") / vim.fn.line("$") * 100)
end

local progress_battery = {
	hl_colors = {
		green = { "green", "PrimaryColor" },
		white = { "white", "PrimaryColor" },
	},
	text = function(_, _, _, is_global)
		local progress = get_parsed_progress(is_global)
		local battery_icon = format_progress_as_battery(progress)

		return { { battery_icon, "green" }, space, { progress .. "%%", "white" } }
	end,
}

local default = {
	filetypes = { "default" },
	colors_name = function(colors)
		colors.PrimaryColor = "#21252B"
		colors.PureWhite = "#ffffff"
		colors.pink = "#f368e0"
		colors.white = "#b7bcc7"
		colors.BatteryGreen = "#72ce6e"

		return colors
	end,
	active = {
		space,
		{ "", { "PureWhite", "PrimaryColor" } },
		space,
		space,
		vi_mode,
		space,
		lsp_diagnos,
		{ basic_components.divider, "" },
		{ "Spaces:" .. tostring(vim.o.tabstop), NORMAL_HIGHLIGHT },
		space,
		space,
		{ basic_components.file_type({ icon = true }), NORMAL_HIGHLIGHT },
		space,
		space,
		{ basic_components.file_encoding(), NORMAL_HIGHLIGHT },
		space,
		space,
		formatter,
		space,
		space,
		{ " ", { "PureWhite", "PrimaryColor" } },
		space,
		space,
		progress_battery,
		space,
	},
	inactive = {},
}

startup_utils.with_safe_startup_page(function()
	windline.setup({
		statuslines = {
			default,
		},
	})
end)
