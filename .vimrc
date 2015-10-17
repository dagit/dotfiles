set nocompatible
filetype off
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
Bundle 'Lokaltog/powerline'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'airblade/vim-gitgutter'
Plugin 'rust-lang/rust.vim'

" lightline.vim config
Bundle 'itchyny/lightline.vim'
"set laststatus=2
"let g:lightline = {
"      \ 'component': {
"      \   'readonly': '%{&readonly?"⭤":""}'
"      \ } }
"if $OS != 'windows'
"    let g:lightline['separator']    =  { 'left': '⮀', 'right': '⮂' }
"    let g:lightline['subseparator'] =  { 'left': '⮁', 'right': '⮃' }
"endif

:let g:haddock_browser="open"

"vim-notes config:
:let g:notes_directories = ['~/AeroFS/Notes']
:let g:notes_suffix = '.md'
:let g:notes_title_sync = 'rename_file'
:let g:notes_shadowdir = '~/AeroFS/Notes'
:let g:notes_indexfile = '.vim-notes.idx'
set t_Co=256
syntax enable
set nocompatible
set backspace=indent,eol,start
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
"set list lcs=tab:>-,trail:.
set ignorecase
set smartcase
"highlight Comment cterm=italic
set ls=2
set encoding=utf-8
set showcmd
set ruler
set number
set title
set ttyfast
set sm

" Set the colors for the space highlights
autocmd ColorScheme * highlight TrailingSpace ctermbg=red  guibg=red
autocmd ColorScheme * highlight Tabs          ctermbg=darkblue guibg=darkblue

""""""" Begin Solarazied Config """""""
" Enable this on computers without solarized pallete
"let g:solarized_termcolors=256
colorscheme solarized
set background=dark
""""""" End Solarazied Config """""""

set guifont=DejaVu\ Sans\ Mono:h12
set cul                                           " highlight current line
hi CursorLine term=underline guibg=NONE gui=underline
set autoread
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
" spelling
if v:version >= 700
  " Enable spell check for text files
  " autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif
" get a list of the files that matched what you are tab completing when 
" specifying a filename pattern
set wildmenu
set wildmode=list:longest,full

" Do some fancy stuff with highlighting trailing whitespace
autocmd BufEnter * let b:m1=matchadd('TrailingSpace','\s\+$',-1)
autocmd BufEnter * let b:m2=matchadd('Tabs', '\t', -1)
" On insert enter we delete the previous pattern and replace it by one that
" doesn't show the highlight for the stuff we're editing.
autocmd InsertEnter * call matchdelete(b:m1)
autocmd InsertEnter * let b:m3=matchadd('TrailingSpace', '\s\+\%#\@<!$',-1)
" On insert leave we put back the original pattern
autocmd InsertLeave * call matchdelete(b:m3)
autocmd InsertLeave * let b:m1=matchadd('TrailingSpace', '\s\+$',-1)
autocmd BufLeave    * call clearmatches()
