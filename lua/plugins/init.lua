local constants = require("utils.constants")

require("plugins.lazy_install")

vim.g.mapleader = " "

require("lazy").setup({
	"rmagatti/auto-session",
	"sindrets/winshift.nvim",
	"stevearc/dressing.nvim",
	"nvim-tree/nvim-web-devicons",
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
	"ibhagwan/fzf-lua",
	"petertriho/nvim-scrollbar",
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
	},
	{
		"mrcjkb/haskell-tools.nvim",
		version = "^3",
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
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
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"kylechui/nvim-surround",
	"mhartington/formatter.nvim",
	"mrjones2014/smart-splits.nvim",
	{
		"mrjones2014/legendary.nvim",
		version = "v2.1.0",
		priority = constants.MAX_PRIORITY,
		lazy = false,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
	},
	"nvim-telescope/telescope-fzf-native.nvim",
	"Bekaboo/dropbar.nvim",
	"windwp/windline.nvim",
	"yamatsum/nvim-cursorline",
	"NeogitOrg/neogit",
	"kazhala/close-buffers.nvim",
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
