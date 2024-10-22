local highlights = require("plugins.configs.neotree-configs.highlights")

return {
	lua = {
		open = "󰝰",
		closed = "󱁿",
	},
	[".github"] = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDirectoryIconGitHubDotFiles,
	},
	[".git"] = {
		open = "󰝰",
		closed = "",
		highlight = highlights.NeoTreeDirectoryIconGitDotFiles,
	},
	src = {
		open = "󰝰",
		closed = "󱂵",
		highlight = highlights.NeoTreeDirectoryIconSource,
	},
	scripts = {
		open = "󰝰",
		closed = "󰴉",
		highlight = highlights.NeoTreeDirectoryIconScripts,
	},
	[".vscode"] = {
		open = "󰝰",
		closed = "󱁿",
		highlight = highlights.NeoTreeDirectoryIconVSCode,
	},
	[".idea"] = {
		open = "󰝰",
		closed = "󱁿",
	},
	patches = {
		open = "󰝰",
		closed = "",
		highlight = highlights.NeoTreeDirectoryIconPatches,
	},
	specs = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDirectoryIconSpec,
	},
	spec = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDirectoryIconSpec,
	},
	tests = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDirectoryIconSpec,
	},
	test = {
		open = "󰝰",
		closed = "󱃪",
		highlight = highlights.NeoTreeDirectoryIconSpec,
	},
	node_modules = {
		open = "󰝰",
		closed = "󱋣",
		highlight = highlights.NeoTreeDirectoryIconNodeModules,
	},
	android = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDirectoryIconAndroid,
	},
	ios = {
		open = "",
		closed = "",
		highlight = highlights.NeoTreeDirectoryIconiOS,
	},
}
