local util = require("lspconfig.util")

return {
	tsserver = {
		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = nil
		end,
		root_dir = util.root_pattern("package.json"),
		single_file_support = false,
	},
}
