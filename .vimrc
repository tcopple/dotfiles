" ---------------------------------------------------------------------------
" first the disabled features due to security concerns
set modelines=0         " no modelines [http://www.guninski.com/vim1.html]

" ---------------------------------------------------------------------------
" operational settings
syntax on
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set showmatch
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces
set smarttab                  " tab and backspace are smart
set tabstop=2                 " 6 spaces
set shiftwidth=2
set nowrap
set scrolloff=5               " keep at le
set backspace=indent,eol,start
set guifont=Monospace\ 10
set noswapfile 
set matchpairs=(:),{:},{:},<:>

" ---------------------------------------------------------------------------
"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set nohls                     " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" ---------------------------------------------------------------------------
"  mouse stuffs
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing

" ---------------------------------------------------------------------------
"last 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

"color stuff
set t_Co=256
colorscheme molokai

"put my swap files in another directory
set directory=/home/user/tcopple/.swaps/
let mapleader=","

"cut and paste stuff
map <C-c> "+y
map <C-x> "+x
map <C-v> "+gP
map <S-Insert> <MiddleMouse>

"key mappings
map <C-h> <Esc>:bp<CR>
map <C-l> <Esc>:bn<CR>
map <S-h> <Esc>:tabp<CR>
map <S-l> <Esc>:tabn<CR>

map <F4> :call OpenReciprocalFile('vsplit')<Return>

" move the current line up or down
nmap <C-Down>  :m+<CR>==
nmap <C-Up> :m-2<CR>==
imap <C-Down>  <C-O>:m+<CR><C-O>==
imap <C-Up> <C-O>:m-2<CR><C-O>==

" move the current line left or right
nmap <C-Left> <<
nmap <C-Right> >>
imap <C-Left> <C-O><<
imap <C-Right> <C-O>>>

" move the selected block up or down
vmap <C-Down>  :m'>+<CR>gv=gv
vmap <C-Up> :m'<-2<CR>gv=gv

" move the selected block left or right
vmap <C-Right> >gv
vmap <C-Left> <gv

"source surround.vim
so ~/.vim/plugins/surround.vim

"source autoclose.vim
so ~/.vim/plugins/autoclose.vim

nnoremap <leader>pe :!p4 edit %<Return>
nnoremap <leader>bd :call CleanClose(0)<Return>
nnoremap <leader>d :NERDTreeToggle<cr>
