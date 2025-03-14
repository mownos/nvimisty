local fidget = require("fidget")

-- fidget.setup()
--
-- -- require("fidget").notify("This is from fidget.notify().")
--
-- vim.notify = fidget.notify
--
-- print = function(...)
-- 	local print_safe_args = {}
-- 	local _ = { ... }
-- 	for i = 1, #_ do
-- 		table.insert(print_safe_args, tostring(_[i]))
-- 	end
-- 	vim.notify(table.concat(print_safe_args, " "), "info")
-- end
