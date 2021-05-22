source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/terminal_mouse_scroll.vim

" Plugin Configurations
source $HOME/.config/nvim/plug-config/nerdtree_config.vim
source $HOME/.config/nvim/plug-config/coc_config.vim
source $HOME/.config/nvim/plug-config/airline_config.vim
source $HOME/.config/nvim/plug-config/codivim_config.vim
source $HOME/.config/nvim/plug-config/floaterm_config.vim
source $HOME/.config/nvim/plug-config/indentline_config.vim
source $HOME/.config/nvim/plug-config/nerdcommenter_config.vim
source $HOME/.config/nvim/plug-config/tagbar_config.vim
source $HOME/.config/nvim/plug-config/fzf_config.vim

source $HOME/.config/nvim/lang/go/go_config.vim
source $HOME/.config/nvim/themes/themes_config.vim
source $HOME/.config/nvim/lang/py/py_config.vim



" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
"if (has('nvim'))
  "let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
"endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
"if (has('termguicolors'))
  "set termguicolors
"endif
