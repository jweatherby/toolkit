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
set wildignore=*.swp,*.bak,*.pyc,*.class,*/node_modules/*,*/shared-media/*,*/media-server/*,*.svg,*.jpg,*.png,*.jpeg,*/locale/*,*.log
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader>. :CtrlPTag<cr>
set tags+=/usr/local/lib/*/tags

let g:tmux_navigator_move_out_of_zoomed_tmux = 2

cabbr <expr> _d expand('%:h')
cabbr <expr> _f @%

"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=89
set formatoptions=qrn1
"set colorcolumn=85
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let mapleader=","
autocmd BufWritePre * :%s/\s\+$//e
"Disable arrow keys to use hjkl instead
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

"powerline"
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts=1
"let g:airline_theme='papercolor'

"disable git-gutter from showing"
let g:airline#extensions#hunks#enabled=0

set statusline=%f       "filename
set statusline+=\ %{fugitive#statusline()} "git indicator
set statusline+=\ %m    "modified flag
set statusline+=\ %r    "readonly flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
" Flake8 ignores
" E121: continuation line under-indented for hanging indent
" E127: continuation line over-indented for visual indent
" E128: Continuation line under-indented for visual indent
" E302: Expected 2 blank lines, found 1
" E501: Line too long
" F999: Syntax error in doctest
" let g:ale_python_flake8_executable = '`which python`'
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_python_flake8_args = "--ignore=E121,E127,E128,E302,E501,F999"
" PyLint ignores
" C0301: Line too long
" C0103: Invalid name ... for type argument (should match [a-z_][a-z0-9_]{2,30}$)
" C010v3: Imports not grouped
" C0111: missing-docstring
" W0403: Relative Import
" E1101: no-member (usually django/inheritance based)
" C1001: old-style-class (`class Meta`)
" W0232: no-init (no __init__ method)
" R0903: too-few-public-methods (class Meta)
" C0103: invalid variable name (single letter)
let g:ale_python_pylint_executable = '`which python`'
let g:ale_python_pylint_options = '--msg-template="{path}:{line}:{column}:{C}: [{msg_id}:{symbol}] {msg}" --disable=C0301,W0142,C010v3,C0412,W0403,E1101,C1001,W0232,R0903,C0111,C0103'
"--msg-template='{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}' --disable=C0301,W0142,C010v3"
" autocmd FileType python SyntasticCheck
" let g:syntastic_loc_list_height=3

" ACK.vim

let g:ackprg = "ag --vimgrep"
let g:ack_autoclose = 1
let g:ack_autofold_results = 0
cnoreabbrev ag Ack!
