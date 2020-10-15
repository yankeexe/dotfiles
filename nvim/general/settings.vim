" Set number
set number

syntax on

"map backspace work properly 
set backspace=indent,eol,start

filetype plugin indent on

"YAML File tab config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set laststatus=2

" Add leader key
let mapleader=","

" No swap file
set noswapfile

" Refresh buffer
nnoremap <F5> :checktime<CR>
set autoread

"Use mouse
set mouse+=a

" Remove highligts from search with double space bar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

