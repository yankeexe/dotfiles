" Copy to system clipboard
" WSL yank support
let s:clip = '/c/Windows/System32/clip.exe'  
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

