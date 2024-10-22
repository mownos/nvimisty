local lspconfig = require("lspconfig")

return {
	deno = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
	},
}
