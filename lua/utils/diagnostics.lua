local diagnostics_utils = {}

function diagnostics_utils.get_diagnostics_count(bufnr)
	bufnr = bufnr or 0
	local diagnostics = vim.diagnostic.get(bufnr)
	local count = { 0, 0, 0, 0 }
	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end
	return count[vim.diagnostic.severity.ERROR],
		count[vim.diagnostic.severity.WARN],
		count[vim.diagnostic.severity.INFO],
		count[vim.diagnostic.severity.HINT]
end

return diagnostics_utils
