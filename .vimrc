"turn of vi compatibility mode
set nocompatible
"set zsh ash shell
set shell=zsh
"turn on syntax hihglight
syntax enable
"download and enable if no vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"enable plugins
call plug#begin('~/.vim/plugged')
"add support for fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plug/vimproc', 'do': 'make' }
Plug 'amitab/vim-unite-cscope'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/wombat256.vim', {'dir': '~/.vim/colors/wombat256'}
Plug 'vim-scripts/summerfruit256.vim', {'dir': '~/.vim/colors/summerfruit256'}
call plug#end()

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
inoremap jk <Esc>
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
"airtline preferences
let g:airline_theme='wombat'
"auto-pairs 
let g:ag_working_path_mode="r"
let g:ag_prg="ag --vimgrep --smart-case"
let g:ag_highlight=1
nmap <F8> :TagbarToggle<CR>
nnoremap <space>? :Ag!<SPACE>
nnoremap - :Ag <C-R><C-W><CR>
nnoremap <space>/ :Files<cr>
nnoremap <space>t :Files
nnoremap <space>- :FZF -q <C-R><C-W><CR>
nnoremap <space><space> :Buffers<cr>
nnoremap <space>h :History<cr>
"for airline support 
set laststatus=2
set ttimeoutlen=50
set encoding=utf-8
let g:airline_powerline_fonts=1 
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>
nmap ,cn :let @+=expand('%:t')<CR>
