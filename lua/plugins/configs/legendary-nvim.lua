require("legendary").setup({
	lazy_nvim = {
		auto_register = true,
	},
	keymaps = {
		{ "<D-p>", ":Legendary<CR>", descrption = "Find commands using Legendary" },
		{ "<D-o>", ":Telescope find_files<CR>", descrption = "Find files via filename suing Telescope" },
		{ "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", "Find content in current buffer using Telescope" },
		{ "<D-f>", ":Telescope live_grep<CR>", "Global match according regex in whole project using Telescope" },
	},
	scratchpad = {
		view = "float",
		results_view = "float",
		float_border = "rounded",
		keep_contents = true,
	},
	extensions = {
		neo_tree = true,
		smart_split = true,
		telescope = true,
	},
	cache_path = string.format("%s", vim.fn.stdpath("cache")),
	log_level = "info",
})
