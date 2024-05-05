local formatter_package_utils = require("formatter.util")
local create_prettier_configs = {}

function create_prettier_configs.apply(languages)
	local formatter_configs = {}

	for _, language in ipairs(languages) do
		formatter_configs[language] = {
			function()
				return {
					exe = "prettierd",
					args = {
						formatter_package_utils.escape_path(formatter_package_utils.get_current_buffer_file_path()),
					},
					stdin = true,
				}
			end,
		}
	end

	return formatter_configs
end

return create_prettier_configs
