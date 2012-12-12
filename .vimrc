" http://phuzz.org/vimrc.html

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'zaiste/tmux.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'Twinside/vim-syntax-haskell-cabal'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'scrooloose/syntastic'
Bundle 'hallison/vim-markdown'
Bundle 'vim-scripts/DoxyGen-Syntax'
Bundle 'vim-scripts/stlrefvim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

:let g:haddock_browser="open"

set t_Co=256
syntax enable
set nocompatible
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
"set list lcs=tab:>-,trail:.
set ignorecase
set smartcase
"highlight Comment cterm=italic
set ls=2
set showcmd
set ruler
set number
set title
set ttyfast
set sm
set cul                                           " highlight current line
"hi CursorLine term=none cterm=none ctermbg=235      " adjust color
set autoread
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif
" get a list of the files that matched what you are tab completing when 
" specifying a filename pattern
set wildmode=full
set wildmenu
