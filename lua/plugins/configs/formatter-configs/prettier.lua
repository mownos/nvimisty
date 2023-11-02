local create_prettier_configs = {}

function create_prettier_configs.apply(languages)
	local formatter_configs = {}

	for _, language in ipairs(languages) do
		formatter_configs[language] = {
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
			-- require("formatter.filetypes." .. language).prettier,
		}
	end

	return formatter_configs
end

return create_prettier_configs
