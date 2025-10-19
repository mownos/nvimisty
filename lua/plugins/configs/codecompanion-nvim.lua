require("codecompanion").setup({
	adapters = {
		http = {
			claude = function()
				return require("codecompanion.adapters").extend("azure_openai", {
					env = {
						api_key = os.getenv("ANTHROPIC_AUTH_TOKEN"),
						endpoint = os.getenv("ANTHROPIC_BASE_URL"),
					},
					schema = {
						model = {
							default = os.getenv("ANTHROPIC_MODEL"),
						},
					},
				})
			end,
		},
	},
	strategies = {
		chat = {
			adapter = "claude",
		},
		inline = {
			adapter = "claude",
		},
	},
})
