" ================================================
"     .vimrc by Robert Tayco
" ================================================

set nocompatible  " don't worry about vi compatibility
filetype off      " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ================================================
"     Plugins (Keep Plugin commands between vundle#begin/end.)
" ================================================
Plugin 'Spacegray.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-unimpaired'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'chrisbra/Colorizer'
" Plugin 'msanders/snipmate.vim'
" Plugin 'ervandew/supertab'
" Plugin 'bingaman/vim-sparkup'
" Plugin 'EasyMotion'
" Plugin 'golden-ratio'
" ================================================

call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Auto-detect filetypes - must follow Vundle. // required!
filetype plugin indent on

" ================================================
"     Platform variables
" ================================================
if has('win32') || has('win64')
   " Windows
   set guifont=Consolas:h11
   set guioptions-=T " removes toolbar
   " set guioptions-=m " removes menubar

   " Set height and width on Windows
   set lines=60
   set columns=170

   " reload _vimrc on save
   if has("autocmd")
      autocmd! bufwritepost _vimrc source $MYVIMRC
   endif

   " Windows has a nasty habit of launching gVim in the wrong working directory
   cd ~
elseif has('gui_macvim')
   " MacVim

   set guifont=inconsolata:h15
   " reload .vimrc on save
   if has("autocmd")
      autocmd! bufwritepost .vimrc source $MYVIMRC
   endif
   " Hide Toolbar in MacVim
   if has("gui_running")
      " Hides the MacVim toolbar
      set guioptions-=T
      " removes vertical scrollbars
      set guioptions-=r
      set guioptions-=l
      set guioptions-=R
      set guioptions-=L
   endif
endif

" ================================================
"     Regular Config
" ================================================

"     Color
" ------------------------
let hour = strftime("%H")
if 6 <= hour && hour < 15
  set background=light
else
  set background=dark
endif

colorscheme solarized
" use F5 to toggle between light and dark solarized schemes
call togglebg#map("<F5>")  

"     UI
" ------------------------
set ruler
set number        " show line numbers
set numberwidth=5 " line number column 5 characters wide
set wrap          " wrap text
set cursorline    " highlight current line
" remove all vertical scrollbars
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

"     Text-formatting
" ------------------------
set linespace=3   " leading
set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set linebreak     " soft wrap text
set textwidth=0   " allow line wrap to work better

"     Search
" ------------------------
" Highlight search, incremental search, ignore case when searching,
" non-case-sensitive search
set hlsearch
set incsearch
set ignorecase
set smartcase

"     Visual
" ------------------------
" set showmatch     " show matching brackets
" set matchtime=3   " how many 1/10s of a second to blink
set showmode      " shows current input mode
set showcmd       " shows current keyboard input

"     Sound
" ------------------------
set noerrorbells
set visualbell
set t_vb=

" plugs security exploits with modelines...I don't even know.
set modelines=0

"     Behaviors
" ------------------------
syntax enable
set autoread   " autoload changes if detected
set wildmenu   " enable wild menu
set wildmode=list:longest,full      " better completion
set wildignore+=*.jpg,*.png,*.gif   " ignore images
set autochdir        " changes the current working directory to the current file
au FocusLost * :wa   " saves all files when Vim loses focus
set scrolloff=8      " scroll when 8 lines from the edge
" applies substitutions globally by default. add /g to restrict to first occurrence.
set gdefault
" match brackets and stuff
set matchpairs+=<:>,(:),{:},":"
set fileencodings=utf-8    " defaults files to use utf-8

" ================================================
"     Bindings
" ================================================

" move around the split windows with <ctrl> + movement keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move through wrapped text line by line
nnoremap j gj
nnoremap k gk

"   Emmet trigger
let g:user_emmet_leader_key='<C-e>'


"     'unimpaired' plugin
" ------------------------------------------------
" Move lines up and down
nmap <C-Up> [e
nmap <C-Down> ]e
" Multiple lines up and down
vmap <C-Up> [egv
vmap <C-Down> ]egv

"     'delimitMate' plugin
" ------------------------------------------------
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

"     Leader
" ------------------------------------------------
" leader key set to comma (',')
let mapleader = ","
" Quick open for editing the .vimrc in a new tab
map <leader>v :tabedit $MYVIMRC<CR>
" toggle NERDTree sidebar
map <leader>f :NERDTreeToggle<CR>
" clears search highlight with <leader> + spacebar
nnoremap <leader><space> :noh<CR>
" strips all trailing white space in a file
nnoremap <leader>x :%s/\s\+$//<CR>:let @/=''<CR>
" creates a vertical split and makes the split current
nnoremap <leader>s <C-w>v<C-w>l

" Get rid of all the <C-v><C-m> crap at the end of lines
nnoremap <leader>m :%s///<CR>
