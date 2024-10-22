require("nvim-ts-autotag").setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
	virtual_text = {
		prefix = "",
		spacing = 5,
		min = "severity",
	},
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})
