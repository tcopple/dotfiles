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
set guifont=Monospace\ 8
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
set cmdheight=1               " command line three lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

autocmd BufNewFile,BufRead *.textile set wrap
autocmd BufNewFile,BufRead *.textile set linebreak
autocmd BufNewFile,BufRead *.textile set nonumber

syntax on

"must learn hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"color stuff
set t_Co=256
colorscheme jellybeans

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

"shortcuts to .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>l :so $MYVIMRC<CR>

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

nnoremap <leader>x0 :%!xxd<CR>
nnoremap <leader>x1 :%!xxd -r<CR>

"remap `a to 'a because we care about columns
nnoremap ' `
nnoremap ` '

map <Leader>s :%s/\<<C-r><C-w>\>/

"fuzzy finder mappings
map <Leader>f :FufFile<CR>
map <Leader>c :FufCoverageFile<CR>

so ~/.vim/personal/clean_close.vim
nnoremap <leader>bd :call CleanClose(0)<Return>

" Automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

inoremap jj <Esc>

"open URL in browser
function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!chrome ".line
endfunction

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
nmap <silent> <leader>e :Errors<CR>


"statusbar fancypants
set laststatus=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]\ %h\ %m\ %r\ %y\ %=%{fugitive#statusline()}\ [%c,%l/%L]\ %P =%{SyntasticStatuslineFlag()}
" set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]\ %h\ %m\ %r\ %y\ %=%{fugitive#statusline()}\ [%c,%l/%L]\ %P

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

