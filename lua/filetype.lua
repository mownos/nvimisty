vim.filetype.add({
	pattern = {
		["%.?env.development"] = "sh",
		["%.?env.production"] = "sh",
	},
})
