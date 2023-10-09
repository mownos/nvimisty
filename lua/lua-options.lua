local os = require("os")

package.path = vim.fn.getcwd() .. "/?.lua;" .. os.getenv("HOME") .. "/.config/nvim/lua/?.lua;" .. package.path
