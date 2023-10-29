vim.cmd([[
augroup kitty_mp
    autocmd!
    au VimLeave * :silent !kitty @ set-spacing padding=10 margin=0
    au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
augroup END 
]])
