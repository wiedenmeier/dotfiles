" .vimrc

" modules
call pathogen#infect()
call pathogen#helptags()

" file management
set autoread
let NERDTreeChDirMode=1
autocmd FileType python let NERDTreeChDirMode=0

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
set textwidth=140
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

" search
nnoremap <LEADER>c :noh<CR>

" bind :make
nnoremap <F8> :make<CR>

" configure nerdtree
nnoremap <F2> :NERDTreeToggle<CR>

" configure tagbar
nnoremap <F3> :TagbarOpenAutoClose<CR>
nnoremap <F4> :TagbarToggle<CR>

" configure syntastic
let g:syntastic_python_checkers=['flake8', 'python3', 'mypy']
" NOTE: this is better configured per-repo in setup.cfg
let g:syntastic_python_flake8_post_args="--max-line-length=140"
let g:syntastic_elixir_checkers=["elixir"]
let g:syntastic_enable_elixir_checker=1
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors=1
nnoremap <F5> :SyntasticReset<CR>
nnoremap <F6> :SyntasticCheck<CR>
nnoremap <F7> :SyntasticToggleMode<CR>
nnoremap <F12> :let g:syntastic_java_javac_config_file=
    \systemlist("git rev-parse --show-toplevel")[0]
    \."/.syntastic_javac_config"<CR>

" configure nvim terminal keybinds
tnoremap <C-]> <C-\><C-n>

" autocomplete config
set dictionary='/usr/share/dict/words'
autocmd FileType vim let b:vcm_tab_complete='vim'
autocmd FileType java let b:vcm_tab_complete='keyword'

" markdonw conf
autocmd FileType markdown let b:vcm_tab_complete='dictionary'
autocmd FileType markdown set textwidth=80

" python config
autocmd FileType python set completeopt-=preview
let g:jedi#use_tabs_not_buffers = 1
let g:goto_definitions_command = "D"
let g:jedi#popup_on_dot = 0

" js config
autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx set syntax=javascript

" gitgutter is being stupidly
let g:gitgutter_terminal_reports_focus = 0

" bullets.vim
let g:bullets_enabled_file_types = ['markdown', 'text', 'gitcommit']
