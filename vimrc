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

map 0 ^
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
nnoremap <leader><leader> <c-^>

autocmd! bufwritepost vimrc source ~/.vimrc
command! FR set filetype=ruby

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Ruby and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make set noexpandtab
  au FileType javascript :iabbrev <buffer> iff if ( ) {  }<left><left><left><left><left><left><left><left>
  au FileType ruby :iabbrev <buffer> lett let(:) {  }<left><left><left><left><left><left><left>

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  augroup RubyShenanigans
    au!
    autocmd BufRead,BufNewFile Gemfile,Rakefile,Capfile
      \ set filetype=ruby
    autocmd BufRead,BufNewFile *.rb
      \ map <C-s> :!ruby -cw %<cr>
  augroup END
endif

" Powerline (https://github.com/Lokaltog/vim-powerline)
let g:Powerline_symbols = 'fancy'
" Fugitive (https://github.com/tpope/vim-fugitive)
noremap <Up>       :echoerr "Use k instead!"<CR>
noremap <Down>     :echoerr "Use j instead!"<CR>
noremap <Left>     :echoerr "Use h instead!"<CR>
noremap <Right>    :echoerr "Use l instead!"<CR>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
augroup ft_fugitive
    au!
    au BufNewFile,BufRead .git/index setlocal nolist
augroup END
" NERDTree (https://github.com/scrooloose/nerdtree)
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
map :where :NERDTreeFind<cr>
au Filetype nerdtree setlocal nolist
let g:NERDTreeWinPos = "left"
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMouseMode = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db', 'tags.bak', 'tags']

" Ctrl-P (https://github.com/kien/ctrlp.vim)
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0 " show the match window at the top of the screen
let g:ctrlp_max_height = 10 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_use_caching = 1 " enable caching
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 1 " show me dotfiles
let g:ctrlp_mruf_max = 250 " number of recently opened files
nmap <leader>lw :CtrlP<CR><C-\>w
nnoremap <c-b> :CtrlPBuffer<cr>                                                " Open CtrlP in buffer mode
nnoremap <c-f> :CtrlPMRU<cr>                                                   " Open CtrlP in recent files mode
