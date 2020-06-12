filetype off
"pathogen"
execute pathogen#infect()
let &runtimepath.=',~/.vim/bundle/ale'
silent! helpags ALL

"vim"
syntax on
filetype plugin indent on
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set undofile
set path+=**
set splitright
set wildignore=*.swp,*.bak,*.pyc,*/node_modules/*,*.svg,*.jpg,*.png,*.jpeg
set mouse=a
set lazyredraw
set regexpengine=1

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch


let g:ackprg = "ag --vimgrep"
let g:ack_autoclose = 1
let g:ack_autofold_results = 0
cnoreabbrev ag Ack!

let mapleader=","
autocmd BufWritePre * :%s/\s\+$//e
nnoremap <F10> <C-w>


let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'python': ['pylint', 'flake8']
\ }

let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "2"
set omnifunc=jedi#completions

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-w><h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w><j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-w><k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-w><l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-w><p> :TmuxNavigatePrevious<cr>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:fugitive_gitlab_domains = ['https://gitlab.points.com']
