local smart_splits = require("smart-splits")
local resession = require("resession")
local cokeline_buffers = require("cokeline.buffers")

require("legendary").setup({
	lazy_nvim = {
		auto_register = true,
	},
	keymaps = {
		{ "<Leader><Leader>i", ":IconPickerNormal<CR>", description = "Pick icons" },
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
		{ "<D-a>", { n = "gg^vG$" }, description = "Select whole buffer content" },
		{ "<A-h>", { n = "<Plug>(cokeline-focus-prev)" }, description = "Switch to the previous tab" },
		{ "<A-l>", { n = "<Plug>(cokeline-focus-next)" }, description = "Switch to the next tab" },
		{
			"<A-c>",
			{
				n = function()
					cokeline_buffers.get_current():delete()
				end,
			},
			description = "Close current buffer",
		},
		{ "<leader>ss", { n = resession.save }, description = "Save current session" },
		{ "<leader>sl", { n = resession.load }, description = "Load previous session" },
		{ "<leader>sd", { n = resession.delete }, description = "Delete previous session" },
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
