" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

au BufNewFile,BufRead *.fnks              setf fnks

set nocompatible
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

syntax on               "Syntax on
set number              "Show line number
set tabstop=4           "Indent is 4 spaces
set shiftwidth=4        "Indent is 4 spaces
set expandtab           "Tabs are spaces, not tabs
"set smartindent         "Indent  automatically
set softtabstop=4       "Let backspace delete indent
set nowrap              "Wrap long lines
"set showmatch          "Show matching parenthesis
set scrolljump=5        "Lines to scroll when cursor leaves window
set scrolloff=3         "Minimum lines to keep above and below cursor

set nocp
filetype plugin on

set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256

colo hybrid

"let g:Powerline_symbols = 'fancy'
