require("nvim-cursorline").setup({
	cursorline = {
		enable = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { bold = true, underline = false },
	},
})
