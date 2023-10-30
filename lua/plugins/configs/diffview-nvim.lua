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
			-- 			{ "n", "c", actions.open_commit_log, { desc = "asd" } },
			{
				"n",
				"<space>",
				actions.toggle_stage_entry,
				{ desc = "Stage / unstage the selected entry" },
			},
		},
	},
})
