local list_utils = require("utils.list")
local AUTO_PAIR_SYMBOL = require("constants.auto-pair")

local function match_auto_pair_symbol(predicate)
	return list_utils.find(AUTO_PAIR_SYMBOL, function(pair)
		local left, right = table.unpack(pair)

		predicate(left, right)
	end)
end

return function(char)
	local pair = list_utils.find(AUTO_PAIR_SYMBOL, function(pair)
		local left, _ = table.unpack(pair)

		return left == char
	end)

	if pair == nil then
		return
	end

	vim.schedule(function()
		vim.api.nvim_put({ pair[2] }, "", true, true)
	end)
end
