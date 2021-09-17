" Add leader key
let mapleader=","

" Auto format Rust files on save.
let g:rustfmt_autosave = 1

" Show line numbers
set number

let g:python3_host_prog = "/usr/bin/python"
syntax on

" Open split on a new tab.
nnoremap <silent> <C-w>w :tab split<CR>

"Map backspace work properly
set backspace=indent,eol,start

filetype plugin indent on

"YAML File tab config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set laststatus=2


" Open terminal as vertical split on the right side.
set splitright
nnoremap <leader>t :vsp <CR> :term <CR>

" Convert buffers to tab
nnoremap <leader>b :tab ball <CR>
"
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

" Buffer navigation
nnoremap gn  :bn<CR>
nnoremap gp :bp<CR>


autocmd FileType python let b:coc_root_patterns = ['venv']

