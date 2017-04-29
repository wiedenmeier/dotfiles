" .vimrc

" indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set backspace=2
set autoindent

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" auto formatting
set textwidth=79
set formatoptions=c,q,r,t

" editor display
set relativenumber
set number
set colorcolumn=+1

" text display
set showmatch

" status bar
set showcmd
set ruler
set wildmenu
set title

" colors
set background=dark

" file management
set autoread
set autochdir

" syntax highlighting
filetype plugin indent on
syntax on

" modules
"call pathogen#infect()
