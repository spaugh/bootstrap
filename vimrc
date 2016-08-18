set nocompatible
"if you call filetype off with filetype not being on first, vim exits with
"non zero exit code. So, we turn it on first just in case
filetype on
filetype off

"Turn syntax highlighting on - 'enable' allows custom highling
syntax enable

"Allow jsx indentation for non-.jsx files
let g:jsx_ext_required = 0

if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()

  "My bundles:
  Plug 'altercation/vim-colors-solarized'
  Plug 'leafgarland/typescript-vim'

	call plug#end()

	"Set solarized colorscheme
    syntax enable
    set background=light
	colorscheme solarized
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
