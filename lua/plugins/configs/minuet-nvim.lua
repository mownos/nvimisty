require("minuet").setup({
	virtualtext = {
		auto_trigger_ft = { "*" },
		keymap = {
			-- accept whole completion
			accept = "<A-l>",
			-- accept one line
			accept_line = "<A-a>",
			-- accept n lines (prompts for number)
			-- e.g. "A-z 2 CR" will accept 2 lines
			accept_n_lines = "<A-z>",
			-- Cycle to prev completion item, or manually invoke completion
			prev = "<A-[>",
			-- Cycle to next completion item, or manually invoke completion
			next = "<A-]>",
			dismiss = "<A-e>",
		},
	},
	provider = "openai_compatible",
	provider_options = {
		openai_compatible = {
			model = "openrouter/google/gemini-2.5-flash",
			stream = true,
			end_point = "https://llm.jp.one2x.ai/chat/completions",
			api_key = "ANTHROPIC_AUTH_TOKEN",
		},
	},
})
