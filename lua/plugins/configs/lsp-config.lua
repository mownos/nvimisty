local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_default_config = lspconfig.util.default_config
local snippet = require("luasnip.loaders.from_vscode")
local import_util = require("utils.import")
local lsp_attach_config = require("plugins.configs.lsp-attach-config")
local mason_lsp = require("mason-lspconfig")

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

mason_lsp.setup({
	automatic_installation = true,
})
mason_lsp.setup_handlers({
	["rust_analyzer"] = function() end,
})

local ls_configs_path = package.searchpath(..., package.path):match(".+/") .. "ls-configs"
local language_configs = import_util.require_dir(ls_configs_path, "plugins.configs.ls-configs")

if language_configs == nil then
	error("Language configs not found")
end

lspconfig.lua_ls.setup(language_configs.lua)
-- lspconfig.denols.setup(language_configs.deno)
lspconfig.ts_ls.setup(language_configs.ts_ls)
lspconfig.clangd.setup({})
-- HLS has been configured by haskell-tools plugin
-- lspconfig.hls.setup({})
lspconfig.cmake.setup(language_configs.cmake)
lspconfig.rust_analyzer.setup(language_configs.rust)
lspconfig.rescriptls.setup({})
lspconfig.eslint.setup({})
lspconfig.typos_lsp.setup(language_configs.typos)
lspconfig.dockerls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.taplo.setup({})
lspconfig.gopls.setup({})
lspconfig.mdx_analyzer.setup({})
lspconfig.jsonls.setup({})
lspconfig.pyright.setup({})
lspconfig.tailwindcss.setup({})
