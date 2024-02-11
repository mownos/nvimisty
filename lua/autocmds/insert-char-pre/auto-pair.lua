local list_utils = require("utils.list")
local AUTO_PAIR_SYMBOL = require("constants.auto-pair")

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
