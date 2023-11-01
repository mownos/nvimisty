local smart_splits = require("smart-splits")
local resession = require("resession")
local cokeline_buffers = require("cokeline.buffers")
local neoscroll = require("neoscroll")

require("legendary").setup({
	lazy_nvim = {
		auto_register = true,
	},
	commands = {
		{ ":DiffviewFileHistory %", description = "View curent buffer git changes history" },
		{ ":SwapBufferLeft", smart_splits.swap_buf_left, description = "Swap buffer to left" },
		{ ":SwapBufferRight", smart_splits.swap_buf_right, description = "Swap buffer to right" },
		{ ":SwapBufferUp", smart_splits.swap_buf_up, description = "Swap buffer to up" },
		{ ":SwapBufferDown", smart_splits.swap_buf_down, description = "Swap buffer to down" },
		{ ":vertical terminal", description = "New terminal vertically" },
		{ ":horizontal terminal", description = "New terminal horizontally" },
		{ ":terminal", description = "Open new terminal in new page" },
		{ ":SaveCurrentSession", resession.save, description = "Save current session" },
		{ ":LoadPrevSession", resession.load, description = "Load previous session" },
		{ ":DeletePrevSession", resession.delete, description = "Delete previous session" },
		{ ":Copilot auth signin", description = "Sign Copilot" },
		{ ":Telescope notify", description = "View notify history" },
	},
	keymaps = {
		{ "do", { n = ":DiffviewOpen<CR>" }, description = "Open diffview compare current buffer content with HEAD~1" },
		{ "dq", { n = ":DiffviewClose<CR>" }, description = "Close diffview" },
		{ "q", { n = ":nohlsearch<CR>" }, description = "Exit hlsearch mode" },
		{ "<A-b>", { n = "<C-w>p" }, description = "Move back" },
		{ "<C-,>", { n = "<C-w>200h" }, "Move to leftmost window" },
		{ "<C-.>", { n = "<C-w>200l" }, "Move to rightmost window" },
		{ "<Leader><Leader>i", ":IconPickerNormal<CR>", description = "Pick icons" },
		{ "<D-p>", ":Legendary<CR>", description = "Find commands using Legendary" },
		{ "<D-o>", ":Telescope find_files<CR>", description = "Find files via filename suing Telescope" },
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
			t = "<C-\\><C-n>",
		}, description = "Exit terminal mode" },
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
					if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
						vim.api.nvim_buf_delete(0, {
							force = true,
						})
						return
					end

					cokeline_buffers.get_current():delete()
				end,
			},
			description = "Close current buffer",
		},
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
