vim.api.nvim_create_autocmd({
	"VimLeave",
}, {
	pattern = "*",
	callback = function()
		os.execute("kitty @ set-spacing padding=10 margin=0")
	end,
})

vim.api.nvim_create_autocmd({
	"VimEnter",
}, {
	pattern = "*",
	callback = function()
		os.execute("kitty @ set-spacing padding=0 margin=0")
	end,
})
