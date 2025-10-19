-- Plugin management using lazy.nvim
-- This file defines all plugins and their basic configurations

local options = require("plugins.lazy-options")
local lazy_constants = require("constants.lazy")

-- Ensure lazy.nvim is installed
require("plugins.lazy-install")

-- Set leader key before loading lazy.nvim
vim.g.mapleader = " "

-- Setup lazy.nvim with all plugins
require("lazy").setup({
	-- Editor enhancements
	"milanglacier/minuet-ai.nvim",
	{
		"chentoast/marks.nvim", -- Enhanced marks functionality
		event = "VeryLazy",
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter" }, -- Auto-close brackets and quotes
	{
		"Aasim-A/scrollEOF.nvim", -- Scroll past end of file
		event = { "CursorMoved", "WinScrolled" },
	},
	{ "echasnovski/mini.icons", version = false }, -- Modern icon support
	{ dir = "~/Repositories/codesnap.nvim" }, -- Local development version of codesnap
	-- {
	-- 	"mistricky/codesnap.nvim",
	-- 	tag = "v2.0.0-beta.16",
	-- },
	{ "rescript-lang/vim-rescript", ft = "rescript" }, -- ReScript language support
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- UI and visual enhancements
	"j-hui/fidget.nvim", -- LSP progress notifications
	"ggandor/leap.nvim", -- Enhanced navigation
	"kosayoda/nvim-lightbulb", -- Code action indicator
	"mistricky/code-link.nvim", -- Generate code links
	"sindrets/winshift.nvim", -- Window management
	"stevearc/dressing.nvim", -- Better UI for vim.ui interfaces

	-- Theme and colorscheme
	{
		"olimorris/onedarkpro.nvim",
		priority = lazy_constants.MAX_PRIORITY, -- Load theme first
	},
	{
		"willothy/veil.nvim", -- Start screen
		lazy = true,
	},

	-- Syntax highlighting and parsing
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Navigation and search
	"karb94/neoscroll.nvim", -- Smooth scrolling
	"ibhagwan/fzf-lua", -- Fuzzy finder
	"petertriho/nvim-scrollbar", -- Visual scrollbar
	"kevinhwang91/nvim-hlslens", -- Enhanced search highlighting
	"nvim-telescope/telescope.nvim", -- Fuzzy finder and picker
	"nvim-telescope/telescope-file-browser.nvim", -- File browser extension
	"nvim-telescope/telescope-fzf-native.nvim", -- Native FZF sorting

	-- AI and coding assistance
	-- "github/copilot.vim", -- GitHub Copilot
	{
		"mrcjkb/haskell-tools.nvim", -- Haskell development tools
		version = "^3",
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},

	-- Code editing and manipulation
	"numToStr/Comment.nvim", -- Easy commenting
	"windwp/nvim-ts-autotag", -- Auto-close HTML/XML tags
	"kylechui/nvim-surround", -- Surround text with brackets, quotes, etc.

	-- Session and state management
	"rmagatti/auto-session", -- Automatic session management

	-- Git integration
	"sindrets/diffview.nvim", -- Git diff viewer
	"f-person/git-blame.nvim", -- Git blame information
	"NeogitOrg/neogit", -- Git interface

	-- Notifications and UI components
	"rcarriga/nvim-notify", -- Better notifications
	"MunifTanjim/nui.nvim", -- UI component library
	"grapp-dev/nui-components.nvim", -- Additional UI components
	"ziontee113/icon-picker.nvim", -- Icon picker

	-- LSP and completion
	"neovim/nvim-lspconfig", -- LSP configurations
	"hrsh7th/cmp-nvim-lsp", -- LSP completion source
	"hrsh7th/nvim-cmp", -- Completion engine
	"hrsh7th/cmp-buffer", -- Buffer completion source
	"hrsh7th/cmp-path", -- Path completion source
	"saadparwaiz1/cmp_luasnip", -- Snippet completion source
	"L3MON4D3/LuaSnip", -- Snippet engine
	"rafamadriz/friendly-snippets", -- Snippet collection
	"williamboman/mason.nvim", -- LSP server manager
	"williamboman/mason-lspconfig.nvim", -- Mason-lspconfig integration
	{
		"ray-x/lsp_signature.nvim", -- Function signature help
		event = "VeryLazy",
	},

	-- Visual enhancements
	"gen740/SmoothCursor.nvim", -- Smooth cursor movement
	"nvim-lua/plenary.nvim", -- Utility library
	"willothy/nvim-cokeline", -- Bufferline
	{
		"nvim-neo-tree/neo-tree.nvim", -- File explorer
		branch = "v3.x",
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Indent guides
	"Bekaboo/dropbar.nvim", -- Breadcrumbs bar
	"windwp/windline.nvim", -- Status line
	"yamatsum/nvim-cursorline", -- Highlight cursor line

	-- Code formatting and tools
	"mhartington/formatter.nvim", -- Code formatter
	"mrjones2014/smart-splits.nvim", -- Smart window splitting
	{
		"mrjones2014/legendary.nvim", -- Command palette
		priority = lazy_constants.MAX_PRIORITY,
		lazy = false,
	},
	"kazhala/close-buffers.nvim", -- Buffer management
	"greggh/claude-code.nvim", -- Claude Code integration
	"olimorris/codecompanion.nvim",
}, options)

-- Configure treesitter for syntax highlighting
local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if ok then
	treesitter.setup({
		ensure_installed = "all", -- Install all available parsers
		ignore_install = { "phpdoc", "ipkg" }, -- Skip parsers that cause issues or crashes
		highlight = { enable = true }, -- Enable syntax highlighting
	})
end

-- Load all plugin configurations
require("plugins.configs")
