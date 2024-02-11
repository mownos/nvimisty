local string_utils = require("utils.string")
local AUTO_PAIR_SYMBOLS = require("constants.auto-pair")
local edit_utils = {}

local function find_last_string_pos_by_pattern(target_str, pattern)
	local res_str = target_str
	local last_pos = 0

	while true do
		local last_pos_start, last_pos_end = string.find(res_str, pattern)

		if last_pos_start == nil then
			return last_pos
		end

		last_pos = last_pos_end + last_pos
		res_str = string.sub(res_str, last_pos_end + 1, string.len(res_str))
	end
end

local function find_symbols_pos(content)
	local symbols_last_pos = {
		find_last_string_pos_by_pattern(content, '""'),
		find_last_string_pos_by_pattern(content, "''"),
		find_last_string_pos_by_pattern(content, "{}"),
		find_last_string_pos_by_pattern(content, "%(%)"),
		find_last_string_pos_by_pattern(content, "%[%]"),
	}

	local res = 0

	for _, last_pos in ipairs(symbols_last_pos) do
		if last_pos >= res then
			res = last_pos
		end
	end

	return res
end

function edit_utils.move_cursor(pos)
	vim.api.nvim_win_set_cursor(0, pos)
end

function edit_utils.move_cursor_to_nearest_symbol()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line_content = vim.api.nvim_get_current_line()
	local parsed_current_line_content = string.sub(current_line_content, 0, cursor_pos[2])
	local res = find_symbols_pos(parsed_current_line_content)

	if res == 0 then
		return
	end

	local parsed_pos = res

	if parsed_pos - 1 < 0 then
		parsed_pos = 0
	end

	edit_utils.move_cursor({ cursor_pos[1], parsed_pos - 1 })
end

function edit_utils.escape_in_symbol()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local current_line_content = vim.api.nvim_get_current_line()

	for _, symbol in ipairs(AUTO_PAIR_SYMBOLS) do
		if
			string_utils.char_at(current_line_content, cursor_pos[2]) == symbol[2]
			and string_utils.char_at(current_line_content, cursor_pos[2] - 1) == symbol[1]
		then
			edit_utils.move_cursor({ cursor_pos[1], cursor_pos[2] - 1 })
			vim.api.nvim_command("startinsert")
			return
		end
	end

	edit_utils.fallback_key("<ESC>")
end

function edit_utils.fallback_key(key)
	local origin_key = vim.api.nvim_replace_termcodes(key, true, false, true)

	vim.api.nvim_feedkeys(origin_key, "n", false)
end

return edit_utils
