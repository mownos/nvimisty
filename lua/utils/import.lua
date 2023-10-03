local io = require("io")
local table_util = require("utils.table")

local import_utils = {}

function import_utils.require_dir(dir_path, require_path)
	local handle = io.popen('ls "' .. dir_path .. '"')

	if handle == nil then
		return
	end

	local result = {}

	for filename in handle:lines() do
		local module_name = filename:match("^[a-zA-Z]+")
		local lib = require(require_path .. module_name)

		if type(lib) == "boolean" then
      goto continue
		end

    print(lib)
		result = table_util.merge(result, lib)
    ::continue::
	end

	return result
end

return import_utils
