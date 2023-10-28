local startup_utils = require("utils.startup")
local get_hex = require("cokeline.hlgroups").get_hl_attr

startup_utils.with_safe_startup_page(function()
	require("cokeline").setup({
		mappings = {
			cycle_prev_next = true,
		},
		default_hl = {
			fg = function(buffer)
				return buffer.is_focused and get_hex("ColorColumn", "bg") or get_hex("Normal", "fg")
			end,
			bg = function(buffer)
				return buffer.is_focused and "#5777c6" or get_hex("ColorColumn", "bg")
			end,
		},
		components = {
			{
				text = function(buffer)
					return " " .. buffer.devicon.icon
				end,
				fg = function(buffer)
					return buffer.devicon.color
				end,
			},
			{
				text = function(buffer)
					return buffer.unique_prefix
				end,
				fg = get_hex("Comment", "fg"),
				italic = true,
			},
			{
				text = function(buffer)
					return buffer.filename .. " "
				end,
				underline = function(buffer)
					return buffer.is_hovered and not buffer.is_focused
				end,
			},
			{
				text = "",
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
