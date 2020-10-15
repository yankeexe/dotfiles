" disable vim-go :GoDef short cut (gd)
" " this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Tab settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

