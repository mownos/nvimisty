local highlights = require("plugins.configs.neotree-configs.highlights")

return {
	lua = {
		open = "󰝰",
		closed = "󱁿",
	},
	[".github"] = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDerectoryIconGitHubDotFiles,
	},
	[".git"] = {
		open = "󰝰",
		closed = "",
		highlight = highlights.NeoTreeDerectoryIconGitDotFiles,
	},
	src = {
		open = "󰝰",
		closed = "󱂵",
		highlight = highlights.NeoTreeDerectoryIconSource,
	},
	scripts = {
		open = "󰝰",
		closed = "󰴉",
		highlight = highlights.NeoTreeDerectoryIconScripts,
	},
	[".vscode"] = {
		open = "󰝰",
		closed = "󱁿",
		highlight = highlights.NeoTreeDerectoryIconVSCode,
	},
	[".idea"] = {
		open = "󰝰",
		closed = "󱁿",
	},
	patches = {
		open = "󰝰",
		closed = "",
		highlight = highlights.NeoTreeDerectoryIconPatches,
	},
	specs = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDerectoryIconSpec,
	},
	spec = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDerectoryIconSpec,
	},
	tests = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDerectoryIconSpec,
	},
	test = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDerectoryIconSpec,
	},
	node_modules = {
		open = "󰝰",
		closed = "󱋣",
		highlight = highlights.NeoTreeDerectoryIconNodeModules,
	},
	android = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDerectoryIconAndroid,
	},
	ios = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDerectoryIconiOS,
	},
}
