local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "IBLBlue", { fg = "#5e76c0" })
end)

require("ibl").setup({
	whitespace = {
		highlight = { "Whitespace" },
		remove_blankline_trail = false,
	},
	scope = {
		show_start = false,
		show_end = false,
		highlight = { "IBLBlue" },
	},
})
