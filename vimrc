syntax on
colorscheme dracula

set number " show line number
set tabstop=2
set shiftwidth=2
set ignorecase
set hlsearch
set swapfile
set dir=/tmp

let g:NERDTreeMapActivateNode = '<Right>'
let g:NERDTreeMapCloseDir = '<Left>'
" let g:nerdtree_tabs_open_on_console_startup=1

" nmap <C-b> :NERDTreeTabsToggle<CR>
nmap <C-P> :Files<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')


"--------------

"*******
" MISC *
"*******

Plug 'machakann/vim-highlightedyank'

"*************
" NAVIGATION *
"*************

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-startify'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ton/vim-bufsurf'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'mhinz/vim-grepper'


"********************
" TEXT MANIPULATION *
"********************

Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

"*****************
" FILE UTILITIES *
"*****************

Plug 'danro/rename.vim'
Plug 'DataWraith/auto_mkdir'
Plug 'tpope/vim-vinegar'

"***************
" TEXT OBJECTS *
"***************

Plug 'wellle/targets.vim'
Plug 'austintaylor/vim-indentobject'
Plug 'vim-scripts/argtextobj.vim'
Plug 'kana/vim-textobj-user'

"*********
" THEMES *
"*********

Plug 'rakr/vim-one'
Plug 'dracula/vim'
Plug 'MaxSt/FlatColor'
Plug 'jacoborus/tender.vim'
Plug 'mhinz/vim-janah'

"******
" CVS *
"******

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"***********
" SNIPPETS *
"***********

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"**************
" PROGRAMMING *
"**************

Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-endwise'
Plug 'rizzatti/funcoo.vim'
Plug 'janko-m/vim-test'

"***************
" RUBY / RAILS *
"***************

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'sunaku/vim-ruby-minitest'
Plug 'nelstrom/vim-textobj-rubyblock'

"************
" JAVASCRIPT
"************

Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

