local startup = {}

function startup.is_startup_page()
	local buf_name = vim.api.nvim_buf_get_name(0):match("[^/]+$")

	return buf_name == "Veil" or buf_name == nil
end

function startup.with_safe_startup_page(fn)
	if not type(fn) == "function" then
		error("The first argument of with_startup_page util must be a function")
	end

	if startup.is_startup_page() then
		return
	end

	fn()
end

return startup
