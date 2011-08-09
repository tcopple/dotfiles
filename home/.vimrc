filetype off

call pathogen#runtime_append_all_bundles()
set modelines=0               " no modelines [http://www.guninski.com/vim1.html]
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
set smartindent               " smart indent
set cindent                   "recommended seting for automatic C-style indentation
set autoindent                "automatic indentation in non-C files
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

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set nohls                     " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  mouse stuffs
set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing

set cursorline
set wildmenu                  "make tab completion act more like bash
set wildmode=list:longest     "tab complete to longest common string, like bash
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set linebreak
set cmdheight=3               " command line three lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal

"put my swap files in another directory
set backupdir=/home/tyler/.vim/backup
set directory=/home/tyler/.vim/backup

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

autocmd BufNewFile,BufRead *.textile set wrap
autocmd BufNewFile,BufRead *.textile set linebreak
autocmd BufNewFile,BufRead *.textile set nonumber

syntax on

"color stuff
set t_Co=256
colorscheme molokai

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

"remap leader to ',' which is much easier than '\'
let mapleader = ',' 

"make nerdtree open when you hit ,d
map <Leader>d :NERDTreeToggle<CR> :set number<CR>  

so ~/.vim/personal/clean_close.vim
nnoremap <leader>bd :call CleanClose(0)<Return>
