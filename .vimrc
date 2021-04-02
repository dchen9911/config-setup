set nocompatible              " be iMproved, required

" for coc and ale 
let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

" To learn later:
" Plug 'junegunn/vim-easy-align'
"
" Browsing github events in vim :GHA! user/repo
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree'

" Nicer status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" auto pair for brackets and quote
Plug 'jiangmiao/auto-pairs'

" auto surround bracket and quotes
Plug 'tpope/vim-surround'

" async lint engine
Plug 'w0rp/ale'

" incremental searching
Plug 'haya14busa/incsearch.vim'

" themes of course
"Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" intellisense + completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Initialize plugin system
call plug#end()


" -------------------------- non plugin stuff

" show line numbers
set number

" for lightline to load on start up
set laststatus=2

" hides buffers when theyre not being used
set hidden

" theme stuff
colorscheme onehalfdark
" set background=dark
set cursorline
syntax on
" 256 colours set
set t_Co=256

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Nerdtree windows size settings
let g:netrw_winsize = 20
let g:netrw_liststyle = 3 "changes the directory tree style to style 3, press i to cycle through the styles temporarily
let g:netrw_banner = 0 "gets rid of the top banner  
let g:netrw_browse_split = 4 "will open files in previous buffer

" also open NERDTree automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" On pressing tab, insert 4 spaces
set expandtab
set autoindent

" toggle nerd tree with F6
nmap <F6> :NERDTreeToggle<CR>

" toggle line numbers with G7
nmap <F7> :set invnumber<CR>


" use ctrl-b to delete word in front
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

" execute macro over visual block
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

set showtabline=0
" press F5 to toggle
noremap <F5> :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<CR>

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

nmap <C-b>1 <Plug>lightline#bufferline#go(1)
nmap <C-b>2 <Plug>lightline#bufferline#go(2)
nmap <C-b>3 <Plug>lightline#bufferline#go(3)
nmap <C-b>4 <Plug>lightline#bufferline#go(4)
nmap <C-b>5 <Plug>lightline#bufferline#go(5)
nmap <C-b>6 <Plug>lightline#bufferline#go(6)
nmap <C-b>7 <Plug>lightline#bufferline#go(7)
nmap <C-b>8 <Plug>lightline#bufferline#go(8)
nmap <C-b>9 <Plug>lightline#bufferline#go(9)
nmap <C-b>0 <Plug>lightline#bufferline#go(10)
