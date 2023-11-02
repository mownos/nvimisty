local constants = require("utils.constants")

require("plugins.lazy_install")

vim.g.mapleader = " "

require("lazy").setup({
	{
		"olimorris/onedarkpro.nvim",
		priority = constants.MAX_PRIORITY,
	},
	{
		"willothy/veil.nvim",
		lazy = true,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"karb94/neoscroll.nvim",
	"petertriho/nvim-scrollbar",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	"numToStr/Comment.nvim",
	"kevinhwang91/nvim-hlslens",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"sindrets/diffview.nvim",
	"windwp/nvim-ts-autotag",
	"rcarriga/nvim-notify",
	"MunifTanjim/nui.nvim",
	"ziontee113/icon-picker.nvim",
	"zbirenbaum/copilot-cmp",
	"neovim/nvim-lspconfig",
	"f-person/git-blame.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"gen740/SmoothCursor.nvim",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"nvim-lua/plenary.nvim",
	"willothy/nvim-cokeline",
	"stevearc/resession.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	"kylechui/nvim-surround",
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"mhartington/formatter.nvim",
	"mrjones2014/smart-splits.nvim",
	{
		"mrjones2014/legendary.nvim",
		version = "v2.1.0",
		priority = constants.MAX_PRIORITY,
		lazy = false,
		dependencies = {
			"stevearc/dressing.nvim",
		},
	},
	"nvim-telescope/telescope-fzf-native.nvim",
	"Bekaboo/dropbar.nvim",
	"windwp/windline.nvim",
	"yamatsum/nvim-cursorline",
})

-- setup treesitter
local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if ok then
	treesitter.setup({
		ensure_installed = "all",
		ignore_install = { "phpdoc" }, -- list of parser which ca issues or crashes
		highlight = { enable = true },
	})
end

require("plugins.configs")
