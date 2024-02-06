require("auto-session").setup({
	auto_session_suppress_dirs = { "~/" },
	pre_save_cmds = { "Neotree close" },
	post_save_cmds = { "Neotree" },
	pre_restore_cmds = { "Neotree close" },
	post_restore_cmds = { "Neotree" },
})
