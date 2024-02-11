local auto_pair = require("autocmds.insert-char-pre.auto-pair")

vim.api.nvim_create_autocmd({ "InsertCharPre" }, {
	callback = function()
		auto_pair(vim.v.char)
	end,
})
