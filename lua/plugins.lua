local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_installed_packer = vim.fn.empty(vim.fn.glob(install_path)) <= 0

local function install_packer()
  if is_installed_packer then
    return
  end
  
  vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[ packadd packer.nvim ]]
end

local function sync_package()
  install_packer()

  require('packer').sync()
end

install_packer()


-- Reload configurations if modify plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "olimorris/onedarkpro.nvim"

end)
