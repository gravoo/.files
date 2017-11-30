set ignorecase "ignore case when searching
set cursorline "show the cursor position all the time
set relativenumber "turn on line numbering
set number
set smartcase "overides ignorecase when capital leaters are used
set incsearch "increment search in buffer
set so=8 "scrolls the tex so that there are always al least five lines above
set numberwidth=2
"turn of swaps files
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands
set autowriteall
set autoread      " Reload files changed outside vim
set shell=zsh "set zsh ash shell
set background=light
set splitbelow
set splitright
set numberwidth=2
set nowrap
set autoindent "configure tabwidth and insert spaces instead of tabs
set tabstop=4   "tab width is 4 spaces
set shiftwidth=4    "indent alsow with 4 spaces
set expandtab   "expand tab to spaces
set softtabstop=4
set clipboard=unnamedplus
set hlsearch "highlights all found items

"download and enable if no vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Initialize plugin system
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'fatih/vim-go'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'benmills/vimux'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs' 
    Plug 'antlypls/vim-colors-codeschool'
    Plug 'mkarmona/colorsbox'
call plug#end()

"add support for 256 colours
set t_Co=256
"colorscheme solarized
"colorscheme codeschool
colorscheme colorsbox-material
syntax enable

"show all files in current buffer
let mapleader = "\<space>"
nnoremap <Leader><Leader> :Buffers<cr>
nnoremap <Leader>/ :Files<cr>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
" Navigate properly when lines are wrapped
nnoremap j gj
inoremap <special> jk <ESC>
inoremap jk <Esc>
nnoremap k gk
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

