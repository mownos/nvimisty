local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_installed_packer = vim.fn.empty(vim.fn.glob(install_path)) <= 0

local function install_packer()
  if is_installed_packer then
    return
  end
  
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[ packadd packer.nvim ]]
end

install_packer()

-- Reload configurations if modify plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use "olimorris/onedarkpro.nvim"
  use 'karb94/neoscroll.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  require "plugins.configs"
end)
