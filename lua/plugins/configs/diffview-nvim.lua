local actions = require("diffview.actions")

require("diffview").setup({
	enhanced_diff_hl = true,
	diff_binaries = false,
	file_panel = {
		listing_style = "list", -- One of 'list' or 'tree'
		win_config = {
			position = "left",
			width = 35,
		},
	},
	keymaps = {
		file_panel = {
			{
				"n",
				"r",
				actions.refresh_files,
				{ desc = "Update stats and entries in the file list" },
			},
			{
				"n",
				"j",
				function()
					actions.next_entry()
					actions.select_entry()
				end,
				{ desc = "Bring the cursor to the next file entry" },
			},
			{
				"n",
				"k",
				function()
					actions.prev_entry()
					actions.select_entry()
				end,
				{ desc = "Bring the cursor to the previous file entry" },
			},
		},
	},
})
