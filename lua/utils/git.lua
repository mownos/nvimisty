local command_util = require("utils.command")
local string_util = require("utils.string")

local git_utils = {}

function git_utils.git_branch()
	local cwd = vim.fn.getcwd()

	return string_util.trim(command_util.exec_command("cd " .. cwd .. " && git branch --show-current", "r"))
end

return git_utils
