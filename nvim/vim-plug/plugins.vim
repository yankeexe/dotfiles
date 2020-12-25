call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'psf/black', { 'tag': '19.10b0' }
	Plug 'nlknguyen/papercolor-theme'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
	Plug 'kien/ctrlp.vim'
	Plug 'voldikss/vim-floaterm'
	Plug 'scrooloose/nerdtree'
	Plug 'yggdroot/indentline'
	Plug 'mattn/emmet-vim'
	Plug 'itchyny/lightline.vim'
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


if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

