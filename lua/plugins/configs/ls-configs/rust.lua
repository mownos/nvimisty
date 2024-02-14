local util = require("lspconfig.util")

return {
	rust = {
		filetypes = { "rust" },
		root_dir = util.root_pattern("Cargo.toml"),
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
			},
		},
	},
}
