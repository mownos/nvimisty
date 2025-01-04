-- require("neoscroll").setup({
-- 	stop_eof = true,
-- 	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
-- 	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
-- 	easing_function = nil, -- Default easing function
-- 	pre_hook = nil, -- Function to run before the scrolling animation starts
-- 	post_hook = nil, -- Function to run after the scrolling animation ends
-- 	performance_mode = false, -- Disable "Performance Mode" on all buffers.
-- })
--
-- require("neoscroll.config").set_mappings({
-- 	["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "175", [['sine']] } },
-- 	["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "175", [['sine']] } },
-- })

require("neoscroll").setup({
	-- Set any options as needed
	mappings = {
		["<C-u>"] = { "scroll", { "-math.ceil(vim.wo.scroll / 2)", "true", "100" } },
		["<C-d>"] = { "scroll", { "math.ceil(vim.wo.scroll / 2)", "true", "100" } },
		["<C-b>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } },
		["<C-f>"] = { "scroll", { "vim.wo.scroll", "true", "200" } },
		["<C-y>"] = { "scroll", { "-0.10", "false", "100" } },
		["<C-e>"] = { "scroll", { "0.10", "false", "100" } },
		["zt"] = { "zt", { "250" } },
		["zz"] = { "zz", { "250" } },
		["zb"] = { "zb", { "250" } },
	},
})

-- local t = {}
-- -- Syntax: t[keys] = {function, {function arguments}}
-- t["<C-u>"] = { "scroll", { "-math.ceil(vim.wo.scroll / 2)", "true", "100" } }
-- t["<C-d>"] = { "scroll", { "math.ceil(vim.wo.scroll / 2)", "true", "100" } }
-- t["<C-b>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } }
-- t["<C-f>"] = { "scroll", { "vim.wo.scroll", "true", "200" } }
-- t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } }
-- t["<C-e>"] = { "scroll", { "0.10", "false", "100" } }
-- t["zt"] = { "zt", { "250" } }
-- t["zz"] = { "zz", { "250" } }
-- t["zb"] = { "zb", { "250" } }

require("neoscroll.config")
