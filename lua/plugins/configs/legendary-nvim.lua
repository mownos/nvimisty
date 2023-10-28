local smart_splits = require("smart-splits")

require("legendary").setup({
	lazy_nvim = {
		auto_register = true,
	},
	keymaps = {
		{ "<D-p>", ":Legendary<CR>", description = "Find commands using Legendary" },
		{ "<D-o>", ":Telescope find_files<CR>", description = "Find files via filename suing Telescope" },
		{
			"<C-f>",
			":Telescope current_buffer_fuzzy_find<CR>",
			description = "Find content in current buffer using Telescope",
		},
		{
			"<D-f>",
			":Telescope live_grep<CR>",
			description = "Global match according regex in whole project using Telescope",
		},
		{ "<C-h>", smart_splits.move_cursor_left, description = "Move cursor left" },
		{ "<C-l>", smart_splits.move_cursor_right, description = "Move cursor right" },
		{ "<C-j>", smart_splits.move_cursor_down, description = "Move cursor down" },
		{ "<C-k>", smart_splits.move_cursor_up, description = "Move cursor up" },
		{ "<C-Up>", smart_splits.resize_up, description = "Resize split window by top" },
		{ "<C-Down>", smart_splits.resize_down, description = "Resize split window by down" },
		{ "<C-Left>", smart_splits.resize_left, description = "Resize split window by left" },
		{ "<C-Right>", smart_splits.resize_right, description = "Resize split window by tight" },
		{ "<C-\\>", {
			n = ":ToggleTerm<CR>",
			t = "<C-\\><C-n>",
		}, description = "Exit terminal mode" },
		{
			"<C-t>h",
			":ToggleTerm size=40 direction=horizontal<CR>",
			description = "Toggle intergrate horizontal terminal",
		},
		{
			"<C-t>v",
			":ToggleTerm size=40 direction=vertical<CR>",
			description = "Toggle intergrate vertical terminal",
		},
		{
			"<C-t>f",
			":ToggleTerm direction=float<CR>",
			description = "Toggle integrate float terminal",
		},
		{
			"r",
			{ v = '"_dp' },
		},
		{
			"s",
			{ v = '"_di' },
			description = "Delete content avoid put in clipboard",
		},
		{ "<D-b>", ":Neotree toggle<CR>", description = "Toggle neotree" },
		{ "<D-s>", ":w<CR>", description = "Save current buffer" },
		{ "<C-g>", ":LazyGit<CR>", description = "Toggle lazygit" },
		{ "<A-h>", ":BufferLineCyclePrev<CR>", description = "Select the prev tab buffer" },
		{ "<A-l>", ":BufferLineCycleNext<CR>", description = "Select the next tab buffer" },
		{ "<A-c>", ":BufferLinePickClose<CR>", description = "" },
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
