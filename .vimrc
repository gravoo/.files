set shell=zsh
"turn on syntax hihglight
syntax enable
"add support for plugins
execute pathogen#infect()
"add support for 256 colours
set t_Co=256
"change colorscheme
colorscheme wombat256mod
" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif
"turn on line numbering
set relativenumber
set number
"copy and paste to system clipboard
set clipboard=unnamed
set clipboard=unnamedplus
"highlight mathing braces
set showmatch
"highlight found pattern
set hlsearch
"use indentation of previous line
set autoindent
"use intelligent indentation for C
set smartindent
"set how many lines vim saves
set history=1000
"ignore case when searching
set ignorecase
"overides ignorecase when capital leaters are used
set smartcase
"configure tabwidth and insert spaces instead of tabs
set tabstop=4	"tab width is 4 spaces
set shiftwidth=4	"indent alsow with 3 spaces
set expandtab	"expand tab to spaces
"auto reload files after 4s
set autoread
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
"scrolls the tex so that there are always al least five lines above
set so=5
"show margin at 120 char in darkgray
highlight ColorColumn ctermbg=darkgray
set colorcolumn=140
"show the cursor position all the time
set cursorline
"enable graphical help in command menu
set wildmenu
