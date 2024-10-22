require("mini.icons").setup({
	extension = {
		rs = { glyph = "󱘗", hl = "MiniIconsRustOrangeYellow" },
		toml = { glyph = "" },
		lock = { glyph = "" },
	},
	filetype = {
		-- Override highlight group (not necessary from 'mini.icons')
		md = { glyph = "󰻲" },
		sh = { glyph = "" },
	},
	file = {
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
