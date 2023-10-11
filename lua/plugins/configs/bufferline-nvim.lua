local bufferline = require("bufferline")

local colors = {
	one_dark_bg = "#292c33",
	inactive_color = "#5d636f",
	normal_color = "#dcdcdc",
	default_bg = "#22252B",
}

vim.opt.termguicolors = true

bufferline.setup({
	highlights = {
		fill = {
			fg = colors.default_bg,
			bg = colors.default_bg,
		},
		background = {
			fg = colors.inactive_color,
			bg = colors.default_bg,
		},
		trunc_marker = {
			fg = colors.inactive_color,
			bg = colors.inactive_color,
		},
		buffer_visible = {
			fg = colors.normal_color,
			bg = colors.one_dark_bg,
		},
		close_button = {
			fg = colors.inactive_color,
			bg = colors.default_bg,
		},
		close_button_visible = {
			fg = colors.inactive_color,
			bg = colors.one_dark_bg,
		},
		close_button_selected = {
			fg = colors.inactive_color,
			bg = colors.one_dark_bg,
		},
		separator = {
			fg = colors.one_dark_bg,
			bg = colors.one_dark_bg,
		},
		separator_selected = {
			fg = colors.one_dark_bg,
			bg = colors.one_dark_bg,
		},
		separator_visible = {
			fg = colors.one_dark_bg,
			bg = colors.one_dark_bg,
		},
		offset_separator = {
			fg = colors.inactive_color,
			bg = colors.one_dark_bg,
		},
		buffer_selected = {
			fg = colors.normal_color,
			bg = colors.one_dark_bg,
			bold = false,
			italic = false,
		},
	},
	options = {
		separator_style = "thin",
		themable = false,
		indicator = {
			style = "none",
		},
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})
