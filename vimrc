let mapleader = ","

if executable('/bin/zsh')
  set shell=/bin/zsh
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/bufkill.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'ervandew/supertab'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'skalnik/vim-vroom'

call vundle#end()
filetype plugin indent on 

set term=xterm-256color
set background=dark
set clipboard=unnamed

hi StatusLineNC cterm=NONE ctermfg=1
hi StatusLine cterm=NONE ctermfg=2
hi TabLine cterm=NONE ctermbg=NONE ctermfg=1 gui=NONE
hi TabLineFill cterm=NONE ctermbg=NONE ctermfg=1 gui=NONE
hi TabLineSel ctermfg=2
hi VertSplit cterm=NONE ctermfg=2 gui=NONE

set nocompatible
set number
set expandtab
set hlsearch
set splitright
set splitbelow
set smartindent
set mouse=a
set mousehide
set shiftwidth=2
set tabstop=2
set noerrorbells visualbell t_vb=
set colorcolumn=80

set list
set listchars=""
set listchars+=trail:.

map <leader><leader> <c-^>
map <silent> <leader><cr> :noh<cr>
map <leader>§ :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>

map <F5> :BD<CR>
map <F6> :bd<CR>

map <leader>. :A<cr>
map <leader>/ :vs<cr>,.
map <leader>? :hs<cr>,.

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>] :tabn<cr>
map <leader>[ :tabp<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Vim Hardcore
" map <Left> :echo "Use H!"<cr>
" map <Right> :echo "Use L!"<cr>
" map <Up> :echo "Use K!"<cr>
" map <Down> :echo Use J!"<cr>

nnoremap <leader>gb :Gblame<cr>

if has("autocmd")
  au FileType make set noexpandtab
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  au BufNewFile,BufRead *.json set ft=javascript

  augroup RubyShenanigans
    au!
    autocmd BufRead,BufNewFile Gemfile,Rakefile,Capfile
      \ set filetype=ruby
  augroup END
endif

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 250
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <c-f> :CtrlPMRU<cr>

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
map :where :NERDTreeFind<cr>
au Filetype nerdtree setlocal nolist
let g:NERDTreeWinPos = "left"
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline= 1
let NERDTreeHijackNetrw= 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db', 'tags.bak', 'tags']
