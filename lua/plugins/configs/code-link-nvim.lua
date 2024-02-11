require("code-link").setup({
	copy_command = function(link)
		return 'echo "' .. link .. '" | pbcopy'
	end,
})
