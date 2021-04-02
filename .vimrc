set nocompatible              " be iMproved, required
set encoding=utf-8

" for coc and ale 
let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

" To learn later:
" Plug 'junegunn/vim-easy-align'
"
" Browsing github events in vim :GHA! user/repo
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

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
" Plug 'morhetz/gruvbox'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'joshdick/onedark.vim'

" improved syntax highlighting (with onedark)
Plug 'sheerun/vim-polyglot'

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

" copies register to external clipboard
vnoremap <C-x> y:let @+=@"<CR>


" theme stuff
" colorscheme onehalfdark
" colorscheme gruvbox
colorscheme onedark
set background=dark

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

" toggle nerd tree with F6
nmap <F6> :NERDTreeToggle<CR>

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

" toggle line numbers with G7
nmap <F7> :set invnumber<CR>


" use ctrl-b to delete word in front
inoremap <C-b> <C-o>dw
" make backspace more powerful
set backspace=indent,eol,start

inoremap <C-x> <C-o>dd

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

" for more customised python support
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
let python_highlight_all=1

" execute macro over visual block
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" -------------------- syntastic settings -----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ------------------ TODO: all the lightline and bufferline settings  -----------------
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
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

" refresh lightline with status changes
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

set showtabline=0
" press F5 to toggle
noremap <F5> :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<CR>

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" easy navigation to buffers
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" ----------------------  All the coc stuff: -----------------------
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" keep the time to 300ms for responsiveness 
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" sign column
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" CR selects first completion item + format on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" navigate the diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


