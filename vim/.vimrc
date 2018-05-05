" .vimrc

" modules
call pathogen#infect()
call pathogen#helptags()

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

" bind :make
nnoremap <F8> :make<CR>

" configure nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" configure tagbar
nnoremap <F3> :TagbarOpenAutoClose<CR>
nnoremap <F4> :TagbarToggle<CR>

" configure syntastic
let g:syntastic_python_checkers=['flake8', 'python3']
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
nnoremap <F5> :SyntasticReset<CR>
nnoremap <F6> :SyntasticCheck<CR>
nnoremap <F7> :let g:syntastic_java_javac_config_file=
    \systemlist("git rev-parse --show-toplevel")[0]
    \."/.syntastic_javac_config"<CR>
