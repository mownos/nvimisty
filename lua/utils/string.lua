local string_utils = {}

function string_utils.char_at(content, index)
	return string.sub(content, index, index)
end

function string_utils.escape(str)
	return str:gsub("[%(%)%.%%%+%-%*%?%[%^%$%]]", "%%%1")
end

return string_utils
