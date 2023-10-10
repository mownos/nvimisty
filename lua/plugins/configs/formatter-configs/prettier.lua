local create_prettier_configs = {}

function create_prettier_configs.apply(languages)
	local formatter_configs = {}

	for _, language in ipairs(languages) do
		formatter_configs[language] = {
			require("formatter.filetypes." .. language).prettier,
		}
	end

	return formatter_configs
end

return create_prettier_configs
