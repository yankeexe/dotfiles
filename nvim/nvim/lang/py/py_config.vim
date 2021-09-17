" Tab settigns for Python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


 "Python Black formatter: format on save. 
let g:black_virtualenv = '~/.vim/black'
let g:black_linelength = 79
autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
set cindent

" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
