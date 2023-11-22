local mime_utils = {}

function mime_utils.is_image(filepath)
	local image_extensions = { "png", "jpg", "jpeg", "svg" } -- Supported image formats
	local split_path = vim.split(filepath:lower(), ".", { plain = true })
	local extension = split_path[#split_path]
	return vim.tbl_contains(image_extensions, extension)
end

return mime_utils
