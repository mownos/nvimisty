local create_prettier_configs = require("plugins.configs.formatter-configs.prettier")
local formatter_util = require("utils.formatter")
local util = require("formatter.util")

-- The prettier can format many languages like TypeScript, JavaScript, JSON, CSS, etc. you can
-- config which language you want to auto format in the following table
local prettier_configs =
	create_prettier_configs.apply({ "typescript", "typescriptreact", "javascript", "javascriptreact", "json", "css" })

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
		go = {
			require("formatter.filetypes.go").gofmt,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		haskell = {
			require("formatter.filetypes.haskell").stylish_haskell,
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
		python = {
			require("formatter.filetypes.python").autopep8,
		},
		table.unpack(prettier_configs),
	},

	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
}, language_configs))
