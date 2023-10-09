local path_utils = {}

function path_utils.get_current_path()
	local current_file_path = vim.api.nvim_buf_get_name(0)
	local current_directory_path = current_file_path:match(".+/")

	return current_directory_path
end

return path_utils
