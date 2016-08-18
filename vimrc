set nocompatible
"if you call filetype off with filetype not being on first, vim exits with
"non zero exit code. So, we turn it on first just in case
filetype on
filetype off

"Turn syntax highlighting on - 'enable' allows custom highling
syntax enable

"Allow jsx indentation for non-.jsx files
let g:jsx_ext_required = 0

" Show buffers instead of tabs
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" To open a new empty buffer
nmap gN :enew<cr>

" Move to the next buffer
nmap gn :bnext<CR>

" Move to the previous buffer
nmap gb :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap gx :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap bl :ls<CR>


if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()

  "My bundles:
  Plug 'chriskempson/base16-vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'vim-airline/vim-airline'

	call plug#end()

  colorscheme base16-default-dark
endif

" without this, backspace will sometimes not work at eol
set backspace=indent,eol,start

set autoread
au! CursorMoved * checktime
au! CursorMovedI * checktime

set tabstop=2
set shiftwidth=2
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"turn on search highlighting
set hls is ic scs

"Turn on language specific indenting
filetype plugin indent on

"tabs dont automatically convert to spaces
set expandtab

"search options
set ignorecase
set smartcase

"change the current working directory to the one of the current buffer
set autochdir

"Turn off the blinking cursor in normal mode:
set gcr=n:blinkon0

"Show the cursor line and column number:
set ruler

"Display the line numbers
set number

"Dont wrap lines if they are longer than screen width
set nowrap

"Ctrl+n to turn off highlighting
nmap <silent> <C-n> :noh<CR>

"~~~~~~ Abbreviations ~~~~~~~
imap kj <Esc> :w <CR>
nmap rw :%s/\s\+$//<CR>
nmap gb gT
nmap <C-k> :bd <CR>
