local highlights = require("plugins.configs.neotree-configs.highlights")

local icons_highlight_colors = {
	{
		highlight = highlights.NeoTreeDerectoryIconAndroid,
		color = "#30d780",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconiOS,
		color = "#ffffff",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconNodeModules,
		color = "#8bc34a",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconPatches,
		color = "#ff7043",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconSpec,
		color = "#00bfa5",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconVSCode,
		color = "#42af5f",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconScripts,
		color = "#f46e7a",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconGitDotFiles,
		color = "#e84d31",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconGitHubDotFiles,
		color = "#546e7a",
	},
	{
		highlight = highlights.NeoTreeDerectoryIconSource,
		color = "#4caf50",
	},
}

for _, item in ipairs(icons_highlight_colors) do
	vim.api.nvim_set_hl(0, item.highlight, { fg = item.color })
end
