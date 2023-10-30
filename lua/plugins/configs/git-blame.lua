vim.g.gitblame_date_format = "%Y/%m/%d %H:%M:%S [%r]"
vim.g.gitblame_highlight_group = "CursorLineGitBlameStatus"
vim.g.gitblame_use_blame_commit_file_urls = true

require("gitblame").setup({
	enabled = true,
})
