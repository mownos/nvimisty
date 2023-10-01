local util = require("formatter.util")

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
	},

	["*"] = {
		-- "formatter.filetypes.any" defines default configurations for any
		-- filetype
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
