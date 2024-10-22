local highlight_utils = {}

function highlight_utils.define_highlights(groups)
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group[1], group[2])
	end
end

return highlight_utils
