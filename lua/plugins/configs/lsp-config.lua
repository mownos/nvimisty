local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_default_config = lspconfig.util.default_config
local snippet = require("luasnip.loaders.from_vscode")
local import_util = require("utils.import")
local lsp_attach_config = require("plugins.configs.lsp-attach-config")
local util = require("lspconfig.util")

-- LSP kay mapping config
vim.api.nvim_create_autocmd("LspAttach", lsp_attach_config)
-- Snippet configuration
snippet.lazy_load()

-- Merge LSP client capabilities config
lsp_default_config.capabilities =
	vim.tbl_deep_extend("force", lsp_default_config.capabilities, cmp_nvim_lsp.default_capabilities())

-- Enable language servers
require("mason").setup({
	PATH = "append",
})

-- mason_lsp.setup({
-- 	automatic_installation = true,
-- 	handlers = {
-- 		["rust_analyzer"] = function() end,
-- 	},
-- })

local ls_configs_path = package.searchpath(..., package.path):match(".+/") .. "ls-configs"
local language_configs = import_util.require_dir(ls_configs_path, "plugins.configs.ls-configs")

if language_configs == nil then
	error("Language configs not found")
end

-- lspconfig.lua_ls.setup(language_configs.lua)
vim.lsp.config("lua_ls", language_configs.lua)

vim.lsp.config("denols", {
	root_markers = { "deno.json", "deno.jsonc" },
	workspace_required = true,
})

vim.lsp.config("ts_ls", {
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
	workspace_required = true,
	single_file_support = false,
	root_dir = function(filename)
		local deno_root = util.root_pattern("deno.json", "deno.jsonc")(filename)

		if deno_root then
			return nil
		end

		return util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(filename)
	end,
})

vim.lsp.config("clangd", {})

-- HLS has been configured by haskell-tools plugin
-- vim.lsp.config("hls", {})

vim.lsp.config("basedpyright", {})

vim.lsp.config("cmake", language_configs.cmake)

-- vim.lsp.config("rust_analyzer", language_configs.rust)

vim.lsp.config("rescriptls", {})

vim.lsp.config("eslint", {})

vim.lsp.config("typos_lsp", language_configs.typos)

vim.lsp.config("dockerls", {})

vim.lsp.config("docker_compose_language_service", {})

vim.lsp.config("taplo", {})

vim.lsp.config("gopls", {})

vim.lsp.config("mdx_analyzer", {})

vim.lsp.config("jsonls", {})

vim.lsp.config("tailwindcss", {})

-- Enable all configured LSPs
vim.lsp.enable({
	"lua_ls",
	"denols",
	"ts_ls",
	"clangd",
	"basedpyright",
	"cmake",
	"rescriptls",
	"eslint",
	"typos_lsp",
	"dockerls",
	"docker_compose_language_service",
	"taplo",
	"gopls",
	"mdx_analyzer",
	"jsonls",
	"tailwindcss",
})
