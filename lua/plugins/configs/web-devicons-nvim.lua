require("nvim-web-devicons").setup({
	override = {
		js = {
			icon = "󰌞",
			color = "#ffca28",
			name = "JavaScript",
		},
		ts = {
			icon = "󰛦",
			color = "#0288d1",
			name = "TypeScript",
		},
		json = {
			icon = "󰘦",
			color = "#feca57",
			name = "JSON",
		},
		toml = {
			icon = "",
			name = "TOML",
		},
	},
	override_by_filename = {
		[".drone.yml"] = {
			icon = "󰐝",
		},
		[".prettierignore"] = {
			icon = "󰰘",
			color = "#f8a5c2",
			name = "PrettierIgnore",
		},
		[".prettierrc"] = {
			icon = "󰰘",
			color = "#f8a5c2",
			name = "Prettierrc",
		},
		["prettier.config.js"] = {
			icon = "󰰘",
			color = "#f8a5c2",
			name = "PrettierConfigJS",
		},
		["package.json"] = {
			icon = "󰏖",
			color = "#27ae60",
			name = "PackageJSON",
		},
		[".gitmodules"] = {
			icon = "󰊢",
			color = "#f1502f",
			name = "GitModules",
		},
		[".gitignore"] = {
			icon = "󰊢",
			color = "#f1502f",
			name = "Gitignore",
		},
		["yarn.lock"] = {
			icon = "",
		},
		["yarn-error.log"] = {
			icon = "",
		},
	},
})
