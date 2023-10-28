function get_cursor_char()
	local win = vim.api.nvim_get_current_win()
	local _, col = vim.api.nvim_win_get_cursor(win)
	--	local char = vim.api.nvim_get_current_line():sub(col + 1, col + 1)

	-- print(vim.inspect(t))
	print(col)
end

-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

-----------------
-- Normal mode --
-----------------
-- Delete without cut
vim.keymap.set("n", "dq", '"_dd')

-- Bracket
vim.keymap.set("n", "<Enter>", function()
	get_cursor_char()
end)

-- Plugins
vim.keymap.set("n", "<D-s>", ":w<CR>", opts)

-- LazyGit
vim.keymap.set("n", "<C-g>", ":LazyGit<CR>", opts)

-- Bufferline
-- vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>")
-- vim.kemap.set("n", "<A-l>", ":BufferLineCycleNext<CR>")
-- vim.keymap.set("n", "<A-c>", ":BufferLinePickClose<CR>")

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-----------------
-- Insert mode --
-----------------
vim.keymap.set("i", "{}", "{}<ESC>i")
vim.keymap.set("i", "()", "()<ESC>i")

-- Insert a blank line if the current char is }
vim.keymap.set("i", "<S-Enter>", "<Enter><ESC>O")
