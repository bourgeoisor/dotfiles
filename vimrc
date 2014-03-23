runtime! archlinux.vim

au BufNewFile,BufRead *.fnks              setf fnks

set nocompatible
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

syntax on
set number
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

function s:setWrapping()
    set wrap
    set wm=2
    set textwidth=72
endfunction

au BufNewFile,BufRead *.txt call s:setWrapping()

" Misc
set nocp
set t_vb=
filetype plugin on
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256

map <F2> :NERDTreeToggle<CR>

let g:hybrid_use_Xresources = 1
colorscheme hybrid

" let g:Powerline_symbols = 'fancy'
