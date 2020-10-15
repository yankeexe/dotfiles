" Auto open NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


" Toggle NERDTree
nmap <silent> <C-b> :NERDTreeToggle<CR>

" Find the location of file
nnoremap <leader>r :NERDTreeFind<CR>
nmap ,n :NERDTreeFind<CR>


