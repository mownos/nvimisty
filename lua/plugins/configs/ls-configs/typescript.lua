local util = require("lspconfig.util")

return {
	tsserver = {
		on_init = function(client)
			if client.server_capabilities then
				client.server_capabilities.semanticTokensProvider = false
			end
		end,
		root_dir = util.root_pattern("package.json"),
		single_file_support = false,
	},
}
