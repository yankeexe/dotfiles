" Use ripgrep for file searches.
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git'" 

let g:fzf_action = {'enter': 'tab split'}

" Search for files.
nnoremap <C-p> :Files<CR>

" Search for text in current file (buffer)
nnoremap <C-f> :BLines<CR>

" Search for text in all project directory.
nnoremap <leader>f :Rg<CR>

" Switch among open tabs
nnoremap <C-o> :Buffers<CR>
