set nocompatible
set background=dark

" Set to auto read/write when a file is changed from the outside
set autoread
set autowrite

" allow switching between buffers without saving
set hidden
let mapleader = ","
set showcmd

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""

" Vundle Bundle manager. Great stuff.
" https://github.com/VundleVim/Vundle.vim
" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" very nice file browser
Bundle 'scrooloose/nerdtree'

" some markdown support
Bundle 'https://github.com/plasticboy/vim-markdown.git'

" full path fuzzy search
Bundle 'kien/ctrlp.vim'

" full path fuzzy search
Bundle 'python.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " " Enable filetype plugins (required)

" NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""
" Color scheme
colorscheme base16-tomorrow
let base16colorspace=256 " Fix for green line numbers

" Sets how many lines of history VIM has to remember
set history=700

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu
set wildmode=longest:full

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

set statusline=%t\ %m\ %r\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %y%=%c,%l/%L\ %P

""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
