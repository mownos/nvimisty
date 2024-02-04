local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_default_config = lspconfig.util.default_config
local snippet = require("luasnip.loaders.from_vscode")
local import_util = require("utils.import")
local lsp_attach_config = require("plugins.configs.lsp-attach-config")

-- LSP kay mapping config
vim.api.nvim_create_autocmd("LspAttach", lsp_attach_config)
-- Snippet configuration
snippet.lazy_load()

-- Merge LSP client capabilities config
lsp_default_config.capabilities =
	vim.tbl_deep_extend("force", lsp_default_config.capabilities, cmp_nvim_lsp.default_capabilities())

-- Enable language servers
require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local ls_configs_path = package.searchpath(..., package.path):match(".+/") .. "ls-configs"
local language_configs = import_util.require_dir(ls_configs_path, "plugins.configs.ls-configs")

if language_configs == nil then
	error("Language configs not found")
end

lspconfig.lua_ls.setup(language_configs.lua)
lspconfig.tsserver.setup(language_configs.tsserver)
lspconfig.clangd.setup({})
-- HLS has been configed by haskell-tools plugin
-- lspconfig.hls.setup({})
lspconfig.cmake.setup(language_configs.cmake)
