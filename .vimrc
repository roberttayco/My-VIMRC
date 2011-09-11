"==========================================================
"	Standard settings
"==========================================================
" don't worry about being compatible with vi
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"================================================
" My Bundles
"================================================
" github repos
"------------------------
Bundle 'msanders/snipmate.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'
Bundle 'surround.vim'
Bundle 'bingaman/vim-sparkup'
Bundle 'EasyMotion'
"================================================

nmap <silent> <leader>t :CommandT<CR>
nmap <silent> <leader>b :CommandTBuffer<CR>

filetype plugin indent on  " required!

" plugs security exploits with modelines...uhh, whatever.
set modelines=0

" Saves all files when Vim loses focus
au FocusLost * :wa

syntax enable
set background=dark
colorscheme solarized
set guifont=menlo:h13
set linespace=7
set cursorline
call togglebg#map("<F5>")

" Quick open for editing the .vimrc
map <leader>e :vsp! $MYVIMRC<CR>
" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

set noerrorbells
set novisualbell
set t_vb=

" Hides the MacVim toolbar
set go-=T
" removes vertical scrollbars
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

" Highlight search, incremental search, ignore case when searching
set hlsearch
set incsearch
set ignorecase

" defaults file to use utf-8 encoding
set fileencodings=utf-8
" show line numbers
set number
" line number column 5 characters wide
set numberwidth=5
set ruler
" changes the current working directory to the current file
set autochdir
" scroll when 8 lines from the edge
set scrolloff=8
" wrap text
set wrap
" soft wrap text
set linebreak
" allow line wrap to work better
set textwidth=0

" enable wild menu
set wildmenu
" better completion
set wildmode=list:longest,full
" ignore images
set wildignore+=*.jpg,*.png,*.gif

set autoindent
set showmode
set showcmd

set smartindent
set tabstop=3
set softtabstop=3
set expandtab
set shiftwidth=3
set smarttab

" applies substitutions globally by default. add /g to restrict to first occurence.
set gdefault
" match brackets and stuff
set matchpairs+=<:>,(:),{:},":"

"==========================================================
"  Custom key mappings
"==========================================================

" leader key is comma (',')
let mapleader = ","

" clears search highlight with <leader> + spacebar
nnoremap <leader><space> :noh<CR>

" strips all trailing white space in a file
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" creates a vertical split and makes the split current
nnoremap <leader>w <C-w>v<C-w>l

" move around the split windows with <ctrl> + movement keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move through wrapped text line by line
nnoremap j gj
nnoremap k gk

"================================================================
" Using 'unimpaired.vim' plugin
"================================================================
" Move lines up and down
nmap <C-Up> [e
nmap <C-Down> ]e
" Multiple lines up and down
vmap <C-Up> [egv
vmap <C-Down> ]egv

let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Get rid of all the <C-v><C-m> crap at the end of lines
nnoremap <leader>m :%s///g<CR>
