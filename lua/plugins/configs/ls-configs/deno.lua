local util = require("lspconfig.util")

return {
	deno = {
		root_dir = util.root_pattern("deno.json", "deno.jsonc"),
	},
}
