let mapleader = ","
filetype off
syntax enable

set shell=/bin/zsh
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'ervandew/supertab'
Bundle 'edsono/vim-matchit'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

set term=xterm-256color
set background=dark
set number
set ruler
set list
set colorcolumn=80
set cmdheight=1
set laststatus=2
set so=7
set wildmenu
set wildmode=list:longest,list:full
set listchars=""
set listchars=tab:▸\
set listchars+=trail:.
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set splitright
set splitbelow
set mouse=a
set mousehide
set showmatch
set mat=2
set foldmethod=manual
set clipboard=unnamed
set smartcase
set ignorecase
set hlsearch
set incsearch
set backspace=eol,start,indent

map <silent> <leader><cr> :noh<cr>
map <leader>pp :setlocal paste!<cr>
map <leader>. :A<cr>
map <leader>/ :vs<cr>,.
map <leader>? :hs<cr>,.
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>] :tabn<cr>
map <leader>[ :tabp<cr>
map :vs :vsplit<cr><c-l>
map :hs :split<cr><c-j>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <F6> :bd<CR>
map <F9> :!ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --extra=+f -R *<CR><CR>
nmap <C-n> :bnext<CR>
nmap <C-b> :bprev<CR>
noremap <Up>       :echoerr "Use k instead!"<CR>
noremap <Down>     :echoerr "Use j instead!"<CR>
noremap <Left>     :echoerr "Use h instead!"<CR>
noremap <Right>    :echoerr "Use l instead!"<CR>
noremap  <F2> :NERDTreeToggle<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader><leader> <c-^>
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <c-f> :CtrlPMRU<cr>

au Filetype nerdtree setlocal nolist
let g:NERDTreeWinPos = "left"
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db', 'tags.bak', 'tags']

let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 10
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 250

autocmd! bufwritepost vimrc source ~/.vimrc
