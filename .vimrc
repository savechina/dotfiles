
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
" Plug 'rust-lang/rust.vim'
Plug 'girishji/vimsuggest'
Plug 'girishji/vimcomplete'
Plug 'yegappan/lsp'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


" NERDTree config 
" 当打开文件时，如果 NERDTree 已打开，则自动定位到该文件
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" 关闭 NERDTree 的快捷键（\n）
nmap <Leader>n :NERDTreeToggle<CR>

" FZF config
" Use ripgrep for file search
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" fzf keymap 
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <Leader>/ :Rg<CR>
nnoremap <Leader>: :Commands<CR>
nnoremap <Leader>G :Rg <C-R><C-W><CR>
nnoremap <C-h> :History<CR>

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

augroup VimLSPConfig

"LSP Config 
" Clangd language server
autocmd User LspSetup call LspAddServer([#{
	\    name: 'clangd',
	\    filetype: ['swift','c', 'cpp','objective-c'],
	\    path: substitute(system('xcrun -f sourcekit-lsp'), '\n$', '', ''),
	\    args: []
	\  }])


" Rust language server
autocmd User LspSetup call LspAddServer([#{
	\    name: 'rustlang',
	\    filetype: ['rust'],
	\    path: '/opt/homebrew/opt/rustup/bin/rust-analyzer',
	\    args: [],
	\    syncInit: v:true,
	\  initializationOptions: #{
    	\    inlayHints: #{
    	\      typeHints: #{
    	\        enable: v:true
    	\      },
    	\      parameterHints: #{
    	\        enable: v:true
    	\      }
    	\    },
    	\  }
	\  }])

" Go language server
autocmd User LspSetup call LspAddServer([#{
	\    name: 'golang',
	\    filetype: ['go', 'gomod'],
	\    path: expand('~/go/bin/gopls'),
	\    args: ['serve'],
	\    syncInit: v:true,
    	\   workspaceConfig: #{
    	\     gopls: #{
    	\       hints: #{
    	\         assignVariableTypes: v:true,
    	\         compositeLiteralFields: v:true,
    	\         compositeLiteralTypes: v:true,
    	\         constantValues: v:true,
    	\         functionTypeParameters: v:true,
    	\         parameterNames: v:true,
    	\         rangeVariableTypes: v:true
    	\       }
    	\     }
    	\   }
	\  }])
augroup END

" This is VimL syntax
let g:my_config_message = "VimL variable"

" 在 VimL 文件中直接定义 Vim9 script 函数
" 注意：函数内部是 Vim9 script 语法
def MyInlineVim9Function(name: string): void
  var greeting: string = 'Hello, ' .. name .. ' from inline Vim9!'
  echomsg greeting
  
var options = {
    completor: { shuffleEqualPriority: true, postfixHighlight: true },
    buffer: { enable: true, priority: 10, urlComplete: true, envComplete: true },
    abbrev: { enable: true, priority: 10 },
    lsp: { enable: true, priority: 10, maxCount: 5 },
    omnifunc: { enable: false, priority: 8, filetypes: ['python', 'javascript'] },
    vsnip: { enable: true, priority: 11 },
    vimscript: { enable: true, priority: 11 },
    ngram: {
        enable: true,
        priority: 10,
        bigram: false,
        filetypes: ['text', 'help', 'markdown'],
        filetypesComments: ['c', 'cpp', 'python', 'java'],
    },
}
enddef

" 你也可以定义一个自动命令，在Vim启动时调用这个函数
" autocmd VimEnter * call MyInlineVim9Function('User')
nnoremap <leader>mv9 :call MyInlineVim9Function('User')<CR>

" 示例：一个简单的命令，显示一条消息
command! MyGreet echomsg "Hello from your custom command!"

" 示例：一个带参数的命令
" <args> 会捕获命令后面的所有参数
command! -nargs=* MyEcho echomsg "You typed: " . <q-args>

command! -nargs=* MyFunc :call MyInlineVim9Function(<q-args>)
