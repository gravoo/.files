"ignore case when searching
set ignorecase
"show the cursor position all the time
set cursorline
"turn on line numbering
set relativenumber
set number
"overides ignorecase when capital leaters are used
set smartcase
"scrolls the tex so that there are always al least five lines above
set so=8
" Navigate properly when lines are wrapped
nnoremap j gj
inoremap <special> jk <ESC>
inoremap jk <Esc>
nnoremap k gk
" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()
set nowrap
syntax enable
set autoindent
"configure tabwidth and insert spaces instead of tabs
set tabstop=4   "tab width is 4 spaces
set shiftwidth=4    "indent alsow with 4 spaces
set expandtab   "expand tab to spaces
set softtabstop=4
"show all files in current buffer
let mapleader = "\<space>"
nnoremap <Leader><Leader> :Buffers<cr>

"turn of swaps files
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands
set autowriteall
set autoread      " Reload files changed outside vim
set autowriteall
"set zsh ash shell
set shell=zsh
set background=light
colorscheme solarized
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
