local smart_splits = require("smart-splits")
local cokeline_buffers = require("cokeline.buffers")
local edit_utils = require("utils.edit")
local telescope_builtin = require("telescope.builtin")
local close_buffers = require("close_buffers")
local copy_current_file_path = require("plugins.configs.legendary-configs.commands.copy-current-file-path")
-- local ufo = require("ufo")

require("legendary").setup({
	lazy_nvim = {
		auto_register = true,
	},
	commands = {
		{ ":Autosession delete", description = "Delete session via telescope" },
		{ ":Autosession search", description = "Search session via telescope" },
		{ ":SessionSave", description = "Save current session" },
		{ ":SessionRestore", description = "Restore previous session" },
		{ ":DiffviewFileHistory %", description = "View curent buffer git changes history" },
		{ ":SwapBufferLeft", smart_splits.swap_buf_left, description = "Swap buffer to left" },
		{ ":SwapBufferRight", smart_splits.swap_buf_right, description = "Swap buffer to right" },
		{ ":SwapBufferUp", smart_splits.swap_buf_up, description = "Swap buffer to up" },
		{ ":SwapBufferDown", smart_splits.swap_buf_down, description = "Swap buffer to down" },
		{ ":vertical terminal", description = "New terminal vertically" },
		{ ":horizontal terminal", description = "New terminal horizontally" },
		{ ":terminal", description = "Open new terminal in new page" },
		{ ":Copilot auth signin", description = "Sign Copilot" },
		{ ":Telescope notify", description = "View notify history" },
		{
			":CopyCurrentFilePath",
			copy_current_file_path,
			description = "Copy relative path of current file into clipboard",
		},
		{ ":PetsNew Misty", description = "Create pets named Misty" },
		{ ":PetsHideToggle", description = "Toggle pets" },
	},
	keymaps = {
		-- { "zr", { n = ufo.openAllFolds }, description = "Open fold" },
		-- { "zm", { n = ufo.closeAllFolds }, description = "Close fold" },
		{ "<C-t>c", { x = ":CodeSnap<CR>" }, description = "Take code snapshot and copt it into clipboard" },
		{ "<C-t>s", { x = ":CodeSnapSave<CR>" }, description = "Take code snapshot and save it on /Pictures" },
		{ "<C-w>w", { n = ":WinShift<CR>" }, description = "Enter to win-mode" },
		{ "<C-w>s", { n = ":WinShift swap<CR>" }, description = "Enter to swap win-mode" },
		{
			"<C-w>r",
			smart_splits.start_resize_mode,
			description = "Resize split window by tight",
		},
		{ "<A-,>", "<Plug>(cokeline-switch-prev)", description = "Switch prev buffer" },
		{ "<A-.>", "<Plug>(cokeline-switch-next)", description = "Switch next buffer" },
		{
			"<ESC>",
			{
				i = function()
					edit_utils.escape_in_symbol()
				end,
			},
		},
		{
			"m",
			{
				n = function()
					edit_utils.move_cursor_to_nearest_symbol()
					vim.api.nvim_command("startinsert")
				end,
			},
			description = "Move cursor in nearst quotes or brackets",
		},
		{ "do", { n = ":DiffviewOpen<CR>" }, description = "Open diffview compare current buffer content with HEAD~1" },
		{ "dq", { n = ":DiffviewClose<CR>" }, description = "Close diffview" },
		{ "q", { n = ":nohlsearch<CR>" }, description = "Exit hlsearch mode" },
		{ "<A-b>", { n = "<C-w>p" }, description = "Move back" },
		{ "<S-h>", { n = "<C-w>200h" }, "Move to leftmost window" },
		{ "<S-l>", { n = "<C-w>200l" }, "Move to rightmost window" },
		{ "<Leader><Leader>i", ":IconPickerNormal<CR>", description = "Pick icons" },
		{ "<D-p>", ":Legendary<CR>", description = "Find commands using Legendary" },
		{ "<D-o>", ":Telescope find_files<CR>", description = "Find files via filename suing Telescope" },
		{ "<D-v>", '<C-R>"', description = "Paste content from clipboard" },
		{
			"th",
			function()
				telescope_builtin.search_history()
			end,
			description = "List search history",
		},
		{
			"tb",
			function()
				telescope_builtin.buffers()
			end,
			description = "List all buffers",
		},
		{
			"tr",
			function()
				telescope_builtin.resume()
			end,
			description = "Resume last telescope picker",
		},
		{
			"<D-f>f",
			function()
				telescope_builtin.grep_string()
			end,
			description = "Global match in whole project using Telescope",
		},
		{
			"<D-f>r",
			function()
				telescope_builtin.live_grep()
			end,
			description = "Global match according regex in whole project using Telescope",
		},
		{ "<C-h>", smart_splits.move_cursor_left, description = "Move cursor left" },
		{ "<C-l>", smart_splits.move_cursor_right, description = "Move cursor right" },
		{ "<C-j>", smart_splits.move_cursor_down, description = "Move cursor down" },
		{ "<C-k>", smart_splits.move_cursor_up, description = "Move cursor up" },
		{ "<C-\\>", {
			t = "<C-\\><C-n>",
		}, description = "Exit terminal mode" },
		{
			"r",
			{ v = '"_dp' },
		},
		{
			"d",
			{ v = '"_di' },
			description = "Delete content avoid put in clipboard",
		},
		{ "<S-Enter>", { i = "<Enter><ESC>O" }, description = "Insert a newline" },
		{ "<D-b>", ":Neotree toggle<CR>", description = "Toggle neotree" },
		{ "<D-s>", ":w<CR>", description = "Save current buffer" },
		{ "<C-g>", ":Neogit kind=vsplit<CR>", description = "Toggle Neogit" },
		{ "<D-a>", { n = "gg^vG$" }, description = "Select whole buffer content" },
		{ "<A-h>", { n = "<Plug>(cokeline-focus-prev)" }, description = "Switch to the previous tab" },
		{ "<A-l>", { n = "<Plug>(cokeline-focus-next)" }, description = "Switch to the next tab" },
		{ "<A-b>", { n = "<Plug>(cokeline-focus-prev)" }, description = "Switch to the previous buffer" },
		{ "<A-f>", { n = "<Plug>(cokeline-focus-next)" }, description = "Switch to the next buffer" },
		{ "<A-b>", { n = "<C-o>" }, description = "Back to previous location" },
		{ "<A-n>", { n = "<C-i>" }, description = "Back to next location" },
		{
			"<A-o>",
			function()
				close_buffers.wipe({ type = "other" })
			end,
			description = "Close other buffers",
		},
		{
			"<A-a>",
			function()
				close_buffers.wipe({ type = "all" })
			end,
			description = "Close all buffers",
		},
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
