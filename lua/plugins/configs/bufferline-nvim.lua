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
		background = {
			fg = colors.inactive_color,
			bg = colors.one_dark_bg,
		},
		trunc_marker = {
			fg = colors.inactive_color,
			bg = colors.one_dark_bg,
		},
		buffer_visible = {
			fg = colors.normal_color,
			bg = nil,
		},
		close_button = {
			fg = colors.inactive_color,
			bg = nil,
		},
		separator = {
			fg = colors.one_dark_bg,
			bg = nil,
		},
		offset_separator = {
			fg = colors.inactive_color,
			bg = nil,
		},
		buffer_selected = {
			fg = colors.normal_color,
			bg = nil,
			bold = false,
			italic = false,
		},
	},
	options = {
		separator_style = "thin",
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
