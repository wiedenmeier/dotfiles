" .vimrc

" modules
call pathogen#infect()

" file management
set autoread
set autochdir

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

" text formatting
set showmatch
set textwidth=79
set formatoptions=c,q,r,t

" editor display
set relativenumber
set number
set colorcolumn=+1
set ttyfast
set splitbelow
set title

" command bar
set showcmd
set wildmenu

" status bar
set laststatus=2
let g:airline_skip_empty_sections=1
let g:airline_section_z="%l/%L:%#__accent_bold#%v%#__restore__#"

" colors
colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"

" syntax highlighting
filetype plugin indent on
syntax on

" configure nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" configure tagbar
nnoremap <F3> :TagbarToggle<CR>
