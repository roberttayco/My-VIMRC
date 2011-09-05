"==========================================================
"	Standard settings
"==========================================================

" don't worry about being compatible with vi
set nocompatible

filetype off
filetype plugin indent on

" Hides the MacVim toolbar
set go-=T

" plugs security exploits with modelines...whatever.
set modelines=0

" Saves all files when Vim loses focus
au FocusLost * :wa

colorscheme sorcerer
set guifont=menlo:h13
set linespace=6
set cursorline

" When vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

set noerrorbells
set novisualbell
set t_vb=

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
set number				                           " show line numbers
set numberwidth=5			                        " line number column 5 characters wide
set ruler
set autochdir				                        " changes the current working directory to the current file

set scrolloff=5				                     " scroll when 3 lines from the edge
set wrap				                              " wrap text
set linebreak				                        " soft wrap text
set textwidth=0				                     " allow line wrap to work better

set wildmenu				                        " enable wild menu
set wildmode=list:longest,full		            " better completion
set wildignore+=*.jpg,*.png,*.gif	            " ignore images

set autoindent
set showmode
set showcmd

set smartindent
set tabstop=3
set softtabstop=3
set expandtab
set shiftwidth=3
set smarttab

set gdefault                                    " applies substitutions globally by default. add /g to restrict to first occurence.

set matchpairs+=<:>,(:),{:},":"		            " match brackets and stuff

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

" move through paragraphs line by line
nnoremap j gj
nnoremap k gk

" Using 'unimpaired.vim' plugin
" Move lines up and down
nmap <C-Up> [e
nmap <C-Down> ]e
" Multiple lines up and down
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Fast editing of the .vimrc
map <leader>e :vsp! $MYVIMRC<CR>

let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" Get rid of all the  crap
nnoremap <leader>m :%s///g<CR>
