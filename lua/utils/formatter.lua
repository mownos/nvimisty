local table_util = require("utils.table")
local formatter_utils = {}

function formatter_utils.merge_filetypes(formatter_config, configs)
	local result = formatter_config.filetype

	for _, config in ipairs(configs) do
		result = table_util.merge(result, config)
	end

	formatter_config.filetype = result

	return formatter_config
end

return formatter_utils
