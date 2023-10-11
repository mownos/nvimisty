local constants = require("utils.constants")

require("plugins.lazy_install")
require("lazy").setup({
	{
		"olimorris/onedarkpro.nvim",
		priority = constants.MAX_PRIORITY,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"karb94/neoscroll.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	"nvim-lualine/lualine.nvim",
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
