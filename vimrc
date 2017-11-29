runtime! archlinux.vim

au BufNewFile,BufRead *.fnks              setf fnks

set nocompatible
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
filetype plugin on

syntax on
set relativenumber
set ruler
set autoread
set lazyredraw

" Whitespace
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Moving around
set scrolljump=5
set scrolloff=3
set backspace=2

" Matching brackets
set showmatch
set mat=2

" Nevermind backups
set nobackup
set nowritebackup
set noswapfile
set noundofile

" Text Wrapping
function s:setWrapping()
    set wrap
    set wm=2
    set textwidth=100
endfunction

" Filetype Specific
au BufNewFile,BufRead *.txt call s:setWrapping()
au BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType html,css,ruby,eruby,javascript,yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Misc
set nocp
set t_vb=
set laststatus=2
set encoding=utf-8
set t_Co=256
set timeoutlen=1000
set ttimeoutlen=0

" Mappings
nnoremap <CR> :nohlsearch<CR>

" Alias
map <F2> :NERDTreeToggle<CR>

" Color Scheme
set background=dark
let g:Powerline_theme='default'
let g:Powerline_colorscheme='solarized16'

"colorscheme solarized
hi LineNr ctermfg=cyan
hi CursorLineNr cterm=bold ctermfg=cyan

