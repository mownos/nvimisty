require("onedarkpro").setup({
	styles = {
		comments = "italic",
		keywords = "italic",
		conditionals = "italic",
	},
	options = {
		cursorline = true,
	},
	highlights = {
		["@lsp.type.variable.typescript"] = {},
		["@lsp.typemod.variable.defaultLibrary.typescript"] = {},
		["@lsp.type.variable.javascript"] = {},
		["@lsp.typemod.variable.defaultLibrary.javascript"] = {},
		["@lsp.type.variable.typescriptreact"] = {},
		["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = {},
	},
})
