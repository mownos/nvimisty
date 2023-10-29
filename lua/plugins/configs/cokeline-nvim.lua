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
		buffers = {
			focus_on_delete = "prev",
		},
		mappings = {
			cycle_prev_next = true,
		},
		default_hl = {
			fg = function(buffer)
				return buffer.is_focused and get_hex("ColorColumn", "bg") or get_hex("Normal", "fg")
			end,
			bg = function(buffer)
				return buffer.is_focused and colors.primary_color or get_hex("ColorColumn", "bg")
			end,
			--	on_mouse_enter = function(buffer)
			--		if buffer.is_hovered then
			--			buffer.bg = colors.primary_color
			--		end
			--	end,
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
			},
			{
				text = function(buffer)
					return buffer.filename .. " "
				end,
				fg = colors.buffer_line_fg,
				-- 	underline = function(buffer)
				-- 		return buffer.is_hovered and not buffer.is_focused
				-- 	end,
			},
			{
				text = function(buffer)
					return buffer.is_modified and "" or ""
				end,
				fg = function(buffer)
					return buffer.is_modified and colors.focused_yellow or colors.buffer_line_fg
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
