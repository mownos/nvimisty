require("avante").setup({
	---@alias Provider "openai" | "claude" | "azure" | "deepseek" | "groq"
	provider = "openai",
	openai = {
		endpoint = "https://api.openai.com",
		model = "gpt-4o-mini",
		temperature = 0,
		max_tokens = 4096,
		api_key_name = "OPENAI_API_KEY",
	},
	mappings = {
		ask = "<C-a>a",
		edit = "<C-a>e",
		refresh = "<C-a>r",
		--- @class AvanteConflictMappings
		diff = {
			ours = "co",
			theirs = "ct",
			none = "c0",
			both = "cb",
			next = "]x",
			prev = "[x",
		},
		jump = {
			next = "]]",
			prev = "[[",
		},
	},
	hints = { enabled = true },
	windows = {
		wrap_line = true,
		width = 30, -- default % based on available width
	},
	highlights = {
		---@type AvanteConflictHighlights
		diff = {
			current = "DiffText",
			incoming = "DiffAdd",
		},
	},
	--- @class AvanteConflictUserConfig
	diff = {
		debug = false,
		autojump = true,
		---@type string | fun(): any
		list_opener = "copen",
	},
})
