set nocompatible
"if you call filetype off with filetype not being on first, vim exits with
"non zero exit code. So, we turn it on first just in case
filetype on
filetype off

"Turn syntax highlighting on - 'enable' allows custom highling
syntax enable

"Allow jsx indentation for non-.jsx files
let g:jsx_ext_required = 0

"" CTRL-P SETTINGS

  " Ignore these files in ctrlP
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
        \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
        \}

  " Also ignore anything in a gitignore in the current working directory
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

  " Use the nearest .git directory as the cwd
  let g:ctrlp_working_path_mode = 'r'

  nmap bb :CtrlPBuffer<cr>
  nmap bm :CtrlPMixed<cr>
  nmap bs :CtrlPMRU<cr>

""" BUFFERGATOR SETTINGS

  " Use the right side of the screen
  let g:buffergator_viewport_split_policy = 'R'

  " Override keymappings
  let g:buffergator_suppress_keymaps = 1

  " Looper buffers
  let g:buffergator_mru_cycle_loop = 1

  " Go to the next buffer open
  nmap gn :BuffergatorMruCycleNext<cr>

  " Go to the previous buffer open
  nmap gp :BuffergatorMruCyclePrev<cr>

  " View the entire list of buffers open
  nmap bl :BuffergatorOpen<cr>
  nmap bn :enew<cr>
  nmap bq :bp <BAR> bd #<cr>

if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin()

  "My bundles:
  Plug 'chriskempson/base16-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'vim-airline/vim-airline'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-commentary'
  Plug 'honza/dockerfile.vim'

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
set softtabstop=2
set smarttab
set expandtab

autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.jsx set filetype=javascript
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *Dockerfile* set filetype=dockerfile


"turn on search highlighting
set hls is ic scs

"Turn on language specific indenting
filetype plugin indent on

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
