"turn of vi compatibility mode
set nocompatible
"set zsh ash shell
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
"set clipboard=unnamed
"set clipboard=unnamedplus
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
set tabstop=4   "tab width is 4 spaces
set shiftwidth=4    "indent alsow with 4 spaces
set expandtab   "expand tab to spaces
set softtabstop=4
set noexpandtab
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
"scrolls the tex so that there are always al least five lines above
set so=8
"show margin at 140 char in darkgray
highlight ColorColumn ctermbg=darkgray
set colorcolumn=140
"show the cursor position all the time
set cursorline
"enable graphical help in command menu
set wildmenu
" redraw when its neceseraly
set lazyredraw
" search as characters are entered
set incsearch
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>
"turn of swaps files
set nobackup
set nowritebackup
set noswapfile 
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" highlight last inserted text
nnoremap gV `[v`]
" save session
nnoremap ,s :mksession<CR>
"if exists read from loacl vimrc
set exrc
set secure
set rtp+=~/.fzf
"Plugin section 
" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb,results:100' " order mathing top to bottom
let g:ctrlp_user_command = 'ag %s -l -a --silent --depth -1 --nogroup --hidden -g ""' " search by ag
let g:ctrlp_line_prefix = '> '
let g:ctrlp_tabpage_position = 'l'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_by_filename = 1 "filter by filename
let g:ctrlp_regexp = 0 "open in regex mode
let g:ctrlp_working_path_mode = 'ac'
let g:ctrlp_lazy_update = 1
let g:ag_working_path_mode="r"
let g:ag_prg="ag --vimgrep --smart-case"
let g:ag_highlight=1
nmap <F8> :TagbarToggle<CR>
nnoremap <space>/ :Ag!<SPACE>
nnoremap <space>f :AgFile!<SPACE>
nnoremap - :Ag! <SPACE><C-R><C-W>
nnoremap <space>- :AgFile! <SPACE><C-R><C-W>
nnoremap <space>p :Files<cr>
nnoremap <space>t :Files
nnoremap <space><space> :Buffers<cr>
"nnoremap <space><space> :<C-u>Unite buffer<cr>
