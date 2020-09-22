" Vim Plugins using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'valloric/youcompleteme'
call plug#end()

"" My Settings
syntax enable
set background=dark
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Automatically open multiple files as tabs when passed 
" Allows vim a.py b.py instead of vim -p a.py b.py
tab all

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview 

" Plugin Specific settings
autocmd vimenter * NERDTree
nmap <F6> :NERDTreeToggle<CR>
filetype plugin on
nmap <F8> :TagbarToggle<CR>
colorscheme molokai


