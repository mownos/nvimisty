require("dressing").setup({
	input = {
		enable = true,
		title_pos = "center",
		relative = "cursor",
		border = "rounded",
	},
	select = {
		enabled = true,
		backend = { "telescope" },
		get_config = function(opts)
			if opts.kind == "legendary.nvim" then
				return {
					telescope = {
						sorter = require("telescope.sorters").fuzzy_with_index_bias({}),
					},
				}
			else
				return {}
			end
		end,
		nui = {
			position = "50%",
			size = nil,
			relative = "editor",
			border = {
				style = "rounded",
			},
			buf_options = {
				swapfile = false,
				filetype = "DressingSelect",
			},
			win_options = {
				winblend = 0,
			},
			max_width = 80,
			max_height = 40,
			min_width = 40,
			min_height = 10,
		},
	},
})
