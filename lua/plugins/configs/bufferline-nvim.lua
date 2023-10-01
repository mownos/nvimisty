vim.opt.termguicolors = true

require "bufferline".setup {
    options = {
      offsets = {
        {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                }
            }
    },
}
