" http://phuzz.org/vimrc.html
set nocompatible              " be iMproved, required
filetype off                  " required

"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle
" required! 
"Plug 'VundleVim/Vundle.vim'
Plug 'zaiste/tmux.vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
"Plugin 'Twinside/vim-syntax-haskell-cabal'
"Plugin 'lukerandall/haskellmode-vim'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-markdown'
"Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'vim-scripts/stlrefvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-scripts/The-NERD-tree'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'kongo2002/fsharp-vim'
"Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-sayonara'

"Plug 'teoljungberg/vim-grep'
"" CtrlP
"Plugin 'ctrlpvim/ctrlp.vim'
"let g:ctrlp_map = '<Space>'
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("t")': [ '<c-g>' ]
"    \ }
"let g:ctrlp_open_new_file = 'r'
"let g:ctrlp_extensions = [ 'mixed', 'quickfix', 'undo' ]
"let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_match_window = 'max:20,results:20'
"let g:ctrlp_mruf_relative = 1
"nnoremap <C-@> :CtrlPBuffer<CR>
"" Silver searcher integration
"if executable('rg')
"    set grepprg=rg\ --nogroup\ --nocolor
"    let g:ctrlp_user_command = 'rg %s --nocolor -g ""'
"endif

" Haskell mode
"Plugin 'elliottt/vim-haskell'

" Tmux integration
Plug 'benmills/vimux'

Plug 'tpope/vim-dispatch'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
"Plug 'viniciusarcanjo/fzf-tabs.nvim', { 'depends': 'fzf.vim' }

call plug#end()
filetype plugin indent on

" airline config
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1


set laststatus=2

:let g:haddock_browser="open"

"vim-notes config:
":let g:notes_directories = ['~/AeroFS/Notes']
:let g:notes_suffix = '.md'
:let g:notes_title_sync = 'rename_file'
":let g:notes_shadowdir = '~/AeroFS/Notes'
:let g:notes_indexfile = '.vim-notes.idx'
set t_Co=256
syntax enable
set nocompatible
set backspace=indent,eol,start
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
autocmd Filetype xml setlocal ts=4 sw=4 sts=0 expandtab
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
set lazyredraw

" Set the colors for the space highlights
"autocmd ColorScheme * highlight TrailingSpace ctermbg=red  guibg=red
"autocmd ColorScheme * highlight Tabs          ctermbg=darkblue guibg=darkblue

function! CocNvimHighlight()
    highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
    highlight CocWarningHighlight ctermfg=Red  guifg=#ff0000
    highlight CocInfoHighlight ctermfg=Red  guifg=#ff0000
    highlight CocHintHighlight ctermfg=Red  guifg=#ff0000
    highlight CocErrorLine ctermfg=Red  guifg=#ff0000
    highlight CocWarningLine ctermfg=Red  guifg=#ff0000
    highlight CocInfoLine ctermfg=Red  guifg=#ff0000
    highlight CocHintLine ctermfg=Red  guifg=#ff0000

    highlight CocHighlightText  guibg=#111111 ctermbg=223
endfunction

autocmd VimEnter function CocNvimHighlight()
autocmd! user coc.nvim CocNvimHighlight()


set guifont=DejaVu\ Sans\ Mono:h12
set cul                                           " highlight current line
hi CursorLine term=underline guibg=NONE gui=underline
set autoread
" get a list of the files that matched what you are tab completing when 
" specifying a filename pattern
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.hi,*.swp,*.bc,dist/*,target/*

"" Do some fancy stuff with highlighting trailing whitespace
autocmd BufEnter * let b:m1=matchadd('TrailingSpace','\s\+$',-1)
autocmd BufEnter * let b:m2=matchadd('Tabs', '\t', -1)
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

" Fold by manually defined folds
set foldenable
set foldmethod=marker

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" If installed using Homebrew
set rtp+=/usr/local/bin/fzf
nmap <C-P> :FZF<CR>
nmap <C-_> :GFiles<CR>
let g:fzf_buffers_jump = 1

" Spell checking
if has("spell")
  setlocal spell spelllang=en_us
  set nospell
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
  autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en
  autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en
endif
" Wrap the line at 80 characters
set textwidth=80

" Enable hidden buffers (so that switching between dirty buffers doesn't throw
" an error)
set hidden

" coc config
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use k to show documentation in preview window.
nnoremap <silent> k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

""""""" Begin Solarazied Config """""""
" Enable this on computers without solarized pallete
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
"set background=light
""""""" End Solarazied Config """""""

hi Pmenu cterm=bold ctermbg=black

" Jump to tab: <Leader>t
function TabName(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

function! s:jumpToTab(line)
    let pair = split(a:line, ' ')
    let cmd = pair[0].'gt'
    execute 'normal' cmd
endfunction

nnoremap <silent><nowait> <leader>t :call fzf#run({
\   'source':  reverse(map(range(1, tabpagenr('$')), 'v:val." "." ".TabName(v:val)')),
\   'sink':    function('<sid>jumpToTab'),
\   'down':    tabpagenr('$') + 2
\ })<CR>

" Use system clipboard
set clipboard=unnamedplus

nnoremap <silent><nowait> <C-x>b :Buffers<cr>
nnoremap <silent><nowait> bn :bnext<cr>
nnoremap <silent><nowait> bt :bNext<cr>

set mouse=
