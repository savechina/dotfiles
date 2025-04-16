
" 配置文件
set nocompatible

filetype on
set number
syntax enable

" 插件管理器
call plug#begin('~/.vim/plugged')

" 插件列表
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim'


call plug#end()

" 启动插件
filetype plugin indent on

" Start NERDTree and leave the cursor in it.
"autocmd VimEnter * NERDTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
