call plug#begin('~/.config/nvim/autoload/plugged')
        Plug 'ptzz/lf.vim'
	Plug 'arzg/vim-colors-xcode'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	Plug 'tpope/vim-eunuch'
	Plug 'hashivim/vim-terraform'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
	Plug 'dense-analysis/ale'
	Plug 'rust-lang/rust.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
	Plug 'psf/black', { 'tag': '19.10b0' }
	Plug 'nlknguyen/papercolor-theme'
	Plug 'voldikss/vim-floaterm'
	Plug 'scrooloose/nerdtree'
	Plug 'yggdroot/indentline'
	Plug 'mattn/emmet-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'airblade/vim-gitgutter'
	Plug 'majutsushi/tagbar'
	Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/nerdcommenter'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'metakirby5/codi.vim'
	Plug 'morhetz/gruvbox'
	Plug 'ap/vim-css-color'
	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }
	Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
	Plug 'kaicataldo/material.vim', { 'branch': 'main'  }

call plug#end()

" Add leader key
let mapleader=","

" Clipboard support WSL2
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

set conceallevel=0

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
