local create_prettier_configs = require("plugins.configs.formatter-configs.prettier")
local formatter_util = require("utils.formatter")

local prettier_configs =
	create_prettier_configs.apply({ "typescript", "typescriptreact", "javascript", "javascriptreact", "json" })

local language_configs = {
	prettier_configs,
}

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]])

require("formatter").setup(formatter_util.merge_filetypes({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						'-style="{BasedOnStyle: llvm, IndentWidth: 2}"',
					},
					stdin = true,
				}
			end,
		},
		table.unpack(prettier_configs),
	},

	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}, language_configs))
