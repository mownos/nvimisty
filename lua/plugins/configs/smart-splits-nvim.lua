local notify_utils = require("utils.notify")

local notification_ref = nil

require("smart-splits").setup({
	ignored_buftypes = {
		"neo-tree",
	},
	resize_mode = {
		quit_key = "<ESC>",
		resize_keys = { "h", "j", "k", "l" },
		silent = true,
		hooks = {
			on_enter = function()
				notification_ref = notify_utils.info(
					notify_utils.create_plugin_title("Smart split"),
					'Resizing mode now!\nPersistent resize mode enabled. Use { "h", "j", "k", "l" } to resize, and <ESC> to finish.'
				)
			end,
			on_leave = function()
				notify_utils.info(
					notify_utils.create_plugin_title("Smart split"),
					"Resizing mode now exited!",
					notification_ref
				)
			end,
		},
	},
})
