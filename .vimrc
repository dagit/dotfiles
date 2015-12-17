" http://phuzz.org/vimrc.html
set nocompatible              " be iMproved, required
filetype off                  " required


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'zaiste/tmux.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'Twinside/vim-syntax-haskell-cabal'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'scrooloose/syntastic'
Plugin 'hallison/vim-markdown'
Plugin 'vim-scripts/DoxyGen-Syntax'
Plugin 'vim-scripts/stlrefvim'
Plugin 'Lokaltog/powerline'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'kongo2002/fsharp-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'mhinz/vim-sayonara'

" lightline.vim config
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

set laststatus=2
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}'
      \ } }
if $OS != 'windows'
    let g:lightline['separator']    =  { 'left': '⮀', 'right': '⮂' }
    let g:lightline['subseparator'] =  { 'left': '⮁', 'right': '⮃' }
endif

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
"set background=light
""""""" End Solarazied Config """""""

set guifont=DejaVu\ Sans\ Mono:h12
set cul                                           " highlight current line
hi CursorLine term=underline guibg=NONE gui=underline
set autoread
" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en
  autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en
endif
" get a list of the files that matched what you are tab completing when 
" specifying a filename pattern
set wildmenu
set wildmode=list:longest,full

"" Do some fancy stuff with highlighting trailing whitespace
"autocmd BufEnter * let b:m1=matchadd('TrailingSpace','\s\+$',-1)
"autocmd BufEnter * let b:m2=matchadd('Tabs', '\t', -1)
"" On insert enter we delete the previous pattern and replace it by one that
"" doesn't show the highlight for the stuff we're editing.
"autocmd InsertEnter * call matchdelete(b:m1)
"autocmd InsertEnter * let b:m3=matchadd('TrailingSpace', '\s\+\%#\@<!$',-1)
"" On insert leave we put back the original pattern
"autocmd InsertLeave * call matchdelete(b:m3)
"autocmd InsertLeave * let b:m1=matchadd('TrailingSpace', '\s\+$',-1)
"autocmd BufLeave    * call clearmatches()

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  "command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" Stuff borrowed from Trevor's vimrc
" Incremental searching
set incsearch
nnoremap <silent> <C-d> :Sayonara<Cr>

