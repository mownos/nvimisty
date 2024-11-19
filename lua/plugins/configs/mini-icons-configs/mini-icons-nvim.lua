require("mini.icons").setup({
	extension = {
		rs = { glyph = "󱘗", hl = "MiniIconsRustOrangeYellow" },
		toml = { glyph = "" },
		lock = { glyph = "" },
	},
	filetype = {
		-- Override highlight group (not necessary from 'mini.icons')
		sh = { glyph = "" },
		html = { glyph = "", hl = "MiniIconsHTMLRed" },
	},
	file = {
		["vite.config.js"] = {
			glyph = "󰹭",
			hl = "MiniIconsVueGreen",
		},
		["vite.config.ts"] = {
			glyph = "󰹭",
			hl = "MiniIconsVueGreen",
		},
		["eslint.config.js"] = {
			glyph = "󰱺",
			hl = "MiniIconsESlintPurple",
		},
		[".gitignore"] = {
			glyph = "󰊢",
			hl = "MiniIconsGitRed",
		},
		["package.json"] = {
			glyph = "󰏖",
			hl = "MiniIconsGreen",
		},
		["README.md"] = {
			glyph = "",
			hl = "grey",
		},
		["yarn.lock"] = {
			glyph = "",
			hl = "Special",
		},
		["yarn-error.log"] = {
			glyph = "",
		},
	},
})
