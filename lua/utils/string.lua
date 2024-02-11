local string_utils = {}

function string_utils.char_at(content, index)
	return string.sub(content, index, index)
end

function string_utils.escape(str)
	return str:gsub("[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1")
end

function string_utils.trim(str)
	return str:gsub("%s+", "")
end

return string_utils
