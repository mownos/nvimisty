return {
	string_self_enum = function(table)
		local result = {}

		for _, item in ipairs(table) do
			result[item] = item
		end

		return result
	end,
}
