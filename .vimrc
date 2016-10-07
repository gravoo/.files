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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plug/vimproc', 'do': 'make' }
Plug 'rking/ag.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/wombat256.vim', {'dir': '~/.vim/colors/wombat256'}
Plug 'vim-scripts/summerfruit256.vim', {'dir': '~/.vim/colors/summerfruit256'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
"Plug 'craigemery/vim-autotag'
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
"copy and paste to system clipboard
set clipboard=unnamed
set clipboard=unnamedplus
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
nnoremap ,<Leader> :nohlsearch<CR>
"turn of swaps files
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands
set autowriteall
set autoread      " Reload files changed outside vim
set autowriteall
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
nmap <F2> :NERDTreeFind<CR>
let mapleader = "\<space>"
nnoremap <Leader>? :Ag!<SPACE>
" find all matches
nnoremap - :Ag <C-R><C-W><CR>
autocmd! VimEnter * command! -nargs=* -complete=file AgC :call fzf#vim#ag_raw(<q-args>)
"show all files in pwd
nnoremap <Leader>/ :Files<cr>
"find exact match of function under the cursor
nnoremap <Leader>- :AgC -Q <C-R><C-W><CR>
"show all files in current buffer
nnoremap <Leader><Leader> :Buffers<cr>
"show files recently visited
nnoremap <Leader>h :History<cr>
"generate ctags after save
nnoremap <silent> <Leader>b :Tags '<C-R><C-W> <CR>
"BLines shortcut
nnoremap <silent> <Leader>B :BLines<CR>
"find file matchin name under the cursor
nnoremap <Leader>f :FZF -q <C-R><C-W><CR>
"for airline support
set laststatus=2
set ttimeoutlen=50
set encoding=utf-8
let g:airline_powerline_fonts=1
let g:cpp_class_scope_highlight = 1
nmap <Leader>cs :let @+=expand("%")<CR>
nmap <Leader>cl :let @+=expand("%:p")<CR>
nmap <Leader>cn :let @+=expand('%:t')<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
let g:clang_format#style_options = {
              \ "AccessModifierOffset" : -4,
              \ "AllowShortIfStatementsOnASingleLine" : "true",
              \ "AlwaysBreakTemplateDeclarations" : "true",
              \ "Standard" : "C++11",
              \ "AllowShortFunctionsOnASingleLine" : "All",
              \ "BinPackParameters" : "false",
              \ "BreakBeforeBraces" : "Allman",
              \ "TabWidth" : 4,
              \ "ColumnLimit " : 120}

set clipboard=unnamed
set clipboard=unnamedplus
