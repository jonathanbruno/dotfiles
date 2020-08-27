set nocompatible              " be iMproved, required
set number relativenumber
set swapfile
set dir=/tmp
set colorcolumn=80
set autoread
"set list          " Display unprintable characters f12 - switches
"set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
set syntax=whitespace

" Color Scheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" More natural split open
set splitbelow
set splitright

" show vertical lines for block
"set cursorcolumn
"set cursorline

set rtp+=~/.fzf
let $FZF_DEFAULT_OPTS='--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore-dir html -g ""'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = { 'down': '60%' }
let g:limelight_conceal_ctermfg = 'gray'
"-----------------------------------------------------------------------------
"-----MAPPINGS----------------------------------------------------------------
"-----------------------------------------------------------------------------

" Resizing buffer
nmap <silent> <C-S-Left> :vertical resize +1<CR>
nmap <silent> <C-S-Right> :vertical resize -1<CR>

" NerdTree Mappings
" this is the key to jump to the nerdtree window from any other window
" map <leader>r :NERDTreeFind<cr>
" open/close nerdtree window
nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>

" RSPEC commands
map <Leader>n :call RunCurrentSpecFile()<CR>
map <Leader>m :call RunNearestSpec()<CR>

" Indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

nmap <C-F> :BLines<CR>
vmap <C-F> <Esc>:BLines<CR>
imap <C-F> <Esc>:BLines<CR>

nmap <C-G> :Rg<CR>
vmap <C-G> <Esc>:Rg<CR>
imap <C-G> <Esc>:Rg<CR>

"FZF
nmap <C-P> :CFiles<CR>
command! -bang -nargs=? -complete=dir CFiles
   \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)

"------------------------------------------------------------------------------

syntax on

autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType elixir setlocal expandtab shiftwidth=2 tabstop=2
let g:ruby_indent_access_modifier_style = 'outdent'
let g:airline_theme = 'solarized'

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let g:NERDTreeMapActivateNode = '<Right>'
let g:NERDTreeMapCloseDir = '<Left>'

let g:ale_fixers = {
      \    'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWritePost *.rb silent! !ripper-tags -R --exclude=vendor

autocmd BufWinEnter * NERDTreeFind
" pressing this inside any open file in vim will jump to the nerdtree and highlight 
" where that file is -> very useful when you have multiple files open at once
"let NERDTreeShowHidden=1

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails'

hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkred guifg=white

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" THEMES
Plugin 'altercation/vim-colors-solarized'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin  'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
" Files structure tree
Plugin 'scrooloose/nerdtree'
" neocomplete Plugin
Plugin 'Shougo/neocomplete.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-repeat'
Plugin 'chase/vim-ansible-yaml'
Plugin 'nikvdp/ejs-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tpope/vim-jdaddy' "Json text objects
Plugin 'rhysd/conflict-marker.vim'
Plugin 'elzr/vim-json'

call vundle#end()            " required
filetype plugin indent on
