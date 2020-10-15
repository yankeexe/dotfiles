" Codi Vim config
highlight CodiVirtualText guifg=cyan
let g:codi#virtual_text_prefix = "> "


" Tab settigns for Python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" Python Black formatter: format on save. 
autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
let g:black_linelength = 79
let g:black_virtualenv = '~/.vim/black'


