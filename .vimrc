
" 配置文件
" 关闭 Vi 兼容模式，启用 Vim 特有功能
set nocompatible

" 启动插件
filetype on
filetype plugin indent on
syntax enable
set number

" 插件管理器
call plug#begin('~/.vim/plugged')

" 插件列表
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree' 
Plug 'terryma/vim-multiple-cursors'
Plug 'hdima/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'girishji/vimsuggest'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" NERDTree config 
" 当打开文件时，如果 NERDTree 已打开，则自动定位到该文件
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" 关闭 NERDTree 的快捷键（\n）
nmap <Leader>n :NERDTreeToggle<CR>

" VimSuggest config
let s:vim_suggest = {}
let s:vim_suggest.cmd = {
    \ 'enable': v:true,
    \ 'pum': v:true,
    \ 'exclude': [],
    \ 'onspace': ['b\%[uffer]','colo\%[rscheme]'],
    \ 'alwayson': v:true,
    \ 'popupattrs': {},
    \ 'wildignore': v:true,
    \ 'addons': v:true,
    \ 'trigger': 't',
    \ 'reverse': v:false,
    \ 'prefixlen': 1,
    \ }

let s:vim_suggest.search = {
    \ 'enable': v:true,
    \ 'pum': v:true,
    \ 'fuzzy': v:false,
    \ 'alwayson': v:true,
    \ 'popupattrs': {
    \   'maxheight': 12
    \ },
    \ 'range': 100,
    \ 'timeout': 200,
    \ 'async': v:true,
    \ 'async_timeout': 3000,
    \ 'async_minlines': 1000,
    \ 'highlight': v:true,
    \ 'trigger': 't',
    \ 'prefixlen': 1,
    \ }

