require("copilot_cmp").setup({
	event = { "InsertEnter", "LspAttach" },
	fix_pairs = true,
	filetypes = {
		["*"] = true,
	},
})
