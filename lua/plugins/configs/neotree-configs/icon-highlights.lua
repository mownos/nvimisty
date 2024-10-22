local highlights = require("plugins.configs.neotree-configs.highlights")

local icons_highlight_colors = {
	{
		highlight = highlights.NeoTreeDirectoryIconAndroid,
		color = "#30d780",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconiOS,
		color = "#ffffff",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconNodeModules,
		color = "#8bc34a",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconPatches,
		color = "#ff7043",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconSpec,
		color = "#00bfa5",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconVSCode,
		color = "#42af5f",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconScripts,
		color = "#f46e7a",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconGitDotFiles,
		color = "#61afef",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconGitHubDotFiles,
		color = "#c8d6e5",
	},
	{
		highlight = highlights.NeoTreeDirectoryIconSource,
		color = "#4caf50",
	},
}

for _, item in ipairs(icons_highlight_colors) do
	vim.api.nvim_set_hl(0, item.highlight, { fg = item.color })
end
