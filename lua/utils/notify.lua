local M = {}

local notify = require("notify")

function M.toast(level)
	return function(title, text, replace)
		notify(text, level, { title = title, timeout = 1500, replace = replace })
	end
end

M.info = M.toast("info")
M.info = M.toast("warn")
M.info = M.toast("error")
M.info = M.toast("info")

function M.with_toast(fn, toast_options)
	return function()
		fn()
		return M.toast("info")(toast_options.title, toast_options.text)
	end
end

function M.create_toast_title(type, content)
	return "" .. type .. "] " .. content
end

function M.create_plugin_title(content)
	return M.create_toast_title("Plugin", content)
end

return M
