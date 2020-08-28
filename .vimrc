" Vim Plugins using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
call plug#end()

" My Settings
syntax enable
set background=dark
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
tab all

" Plugin Specific settings
autocmd vimenter * NERDTree
filetype plugin on
nmap <F8> :TagbarToggle<CR>
colorscheme molokai
