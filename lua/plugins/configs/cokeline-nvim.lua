local startup_utils = require("utils.startup")
local get_hex = require("cokeline.hlgroups").get_hl_attr

local colors = {
	primary_color = "#5777c6",
	hovered_color = "#8397c7",
	buffer_line_fg = "#dcdcdc",
	focused_yellow = "#fdcb6e",
}

startup_utils.with_safe_startup_page(function()
	require("cokeline").setup({
		sidebar = {
			filetype = { "NvimTree", "neo-tree" },
			components = {
				{
					text = "",
					bg = "#1c1f26",
				},
			},
		},
		buffers = {
			focus_on_delete = "prev",
		},
		mappings = {
			cycle_prev_next = true,
		},
		default_hl = {
			bg = function(buffer)
				return buffer.is_focused and "#282c34" or "#21252b"
			end,
		},
		components = {
			{
				text = function(buffer)
					return " " .. buffer.devicon.icon
				end,
				fg = function(buffer)
					return buffer.is_focused and buffer.devicon.color or "#ABB2BF"
				end,
			},
			{
				text = function(buffer)
					return buffer.unique_prefix
				end,
			},
			{
				text = function(buffer)
					return buffer.filename .. " "
				end,
				fg = function(buffer)
					local color = buffer.is_focused and "#ffffff" or "#abb2bf"
					local modified_color = buffer.is_modified and "#dfc184" or color
					local error_color = buffer.diagnostics.errors == 0 and modified_color or "#e06c75"

					return error_color
				end,
				bold = function(buffer)
					return buffer.is_focused
				end,
				italic = function(buffer)
					return buffer.is_modified
				end,
			},
			{
				text = function(buffer)
					local focused_icon = buffer.is_focused and "" or ""

					return buffer.is_modified and "" or focused_icon
				end,
				fg = function(buffer)
					local focused_color = buffer.is_focused and "#98C379" or colors.buffer_line_fg

					return buffer.is_modified and colors.focused_yellow or focused_color
				end,
				on_click = function(_, _, _, _, buffer)
					buffer:delete()
				end,
			},
			{
				text = " ",
			},
		},
	})
end)
