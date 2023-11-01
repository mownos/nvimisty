local string_utils = {}

function string_utils.char_at(content, index)
	return string.sub(content, index, index)
end

return string_utils
