local veil = require("veil")
local builtin = require("veil.builtin")

veil.setup({
	sections = {
		builtin.sections.animated(builtin.headers.frames_nvim, {
			hl = { fg = "#5de4c7" },
		}),
		builtin.sections.buttons({
			{
				icon = "",
				text = "Upgrade packages",
				shortcut = "u",
				callback = function()
					vim.cmd("Lazy update")
				end,
			},
			{
				icon = "",
				text = "Config",
				shortcut = "c",
				callback = function()
					require("telescope").extensions.file_browser.file_browser({
						path = vim.fn.stdpath("config"),
					})
				end,
			},
			{
				icon = "",
				text = "Find Files",
				shortcut = "f",
				callback = function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				icon = "",
				text = "Find Word",
				shortcut = "w",
				callback = function()
					require("telescope.builtin").live_grep()
				end,
			},
			{
				icon = "",
				text = "Buffers",
				shortcut = "b",
				callback = function()
					require("telescope.builtin").buffers()
				end,
			},
		}),
		-- builtin.sections.oldfiles(),
	},
	mappings = {},
	startup = true,
	listed = false,
})
