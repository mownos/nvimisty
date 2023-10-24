local constants = require("utils.constants")

require("plugins.lazy_install")

vim.g.mapleader = " "

require("lazy").setup({
	{
		"olimorris/onedarkpro.nvim",
		priority = constants.MAX_PRIORITY,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"karb94/neoscroll.nvim",
	"petertriho/nvim-scrollbar",
	"neovim/nvim-lspconfig",
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
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	-- "nvim-lualine/lualine.nvim",
	"lewis6991/gitsigns.nvim",
	"kylechui/nvim-surround",
	"akinsho/toggleterm.nvim",
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	"akinsho/bufferline.nvim",
	"mhartington/formatter.nvim",
	"mrjones2014/smart-splits.nvim",
	{
		"mrjones2014/legendary.nvim",
		version = "v2.1.0",
		priority = constants.MAX_PRIORITY,
		lazy = false,
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				branch = "0.1.x",
			},
			"stevearc/dressing.nvim",
		},
	},
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
