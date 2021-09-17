" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


 let g:lightline = {
	\ 'colorscheme': 'PaperColor',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'gitbranch','relativepath' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
 	\   'gitbranch': 'FugitiveHead' 
	\ },
	\ }



autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

