vim.g.barbar_auto_setup = false

require "barbar".setup {
  animation = true,
  separator = {left = '', right = '▎'},
  sidebar_filetypes = {
    ['neo-tree'] = true
  }
}
