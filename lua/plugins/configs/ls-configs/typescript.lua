return {
	tsserver = {
		on_attach = function(client)
			client.server_capabilities.semanticTokensProvider = nil
		end,
	},
}
