set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" autocomplete plugin
Plugin 'ycm-core/YouCompleteMe'
" shows the buffers currently opened
Plugin 'bling/vim-bufferline'
" makes it look a bit nicer
Plugin 'morhetz/gruvbox'
" incremental search
Plugin 'haya14busa/incsearch.vim'
" for HTML coding (useless to me but guess ill keep it)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"vundle managed nerdtree
Plugin 'preservim/nerdtree'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -------------------------- non plugin stuff

" for switching tabs (not used)
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

let g:netrw_winsize = 20
let g:netrw_liststyle = 3 "changes the directory tree style to style 3, press i to cycle through the styles temporarily
let g:netrw_banner = 0 "gets rid of the top banner  
let g:netrw_browse_split = 4 "will open files in previous buffer

" show line numbers
set number

" show buffers by pressing f5
nnoremap <F5> :buffers<CR>:buffer<Space>


" use NERDTree as file explorer plugin
autocmd vimenter * NERDTree

" also open NERDTree automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd VimEnter * wincmd l

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab
set autoindent

" gruvbox which makes things prettier
colorscheme gruvbox
set background=dark

" remap ctrl backspace to delete a word
" imap <C-BS> <C-W>
" workaround for terminal vim
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

inoremap <C-b> <C-o>dw

" make backspace more powerful
set backspace=indent,eol,start

" for better searching
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" TODO: Fix this
" set h:lsearch
let g:incsearch#auto_nohlsearch = 1 " auto stops highlighting
" re highlight when n pressed
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" makes it faster to move up and down
nnoremap <S-Down> 6j
nnoremap <S-Up> 6k
inoremap <S-Down> <C-o>6j
inoremap <S-Up> <C-o>6k

nnoremap <C-Down> 15j
nnoremap <C-Up> 15k
inoremap <C-Down> <C-o>15j
inoremap <C-Up> <C-o>15k

"move text up and down
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" toggle nerd tree with F6
nmap <F6> :NERDTreeToggle<CR>

" toggle line numbers with G7
nmap <F7> :set invnumber<CR>

" auto bracket and quote
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
