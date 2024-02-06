local os = require("os")
local string_utils = require("utils.string")

return function()
	local full_file_path = vim.fn.expand("%:p")
	local cwd = vim.fn.getcwd()
	local parsedPath = full_file_path:gsub(string_utils.escape(cwd), ""):sub(2)

	os.execute('echo "' .. parsedPath .. '" | pbcopy')
end
