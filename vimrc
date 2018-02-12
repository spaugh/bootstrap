if !exists("g:syntax_on")
  syntax enable
endif

set termguicolors
filetype plugin indent on
set ruler
set number
set nowrap
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2
autocmd Filetype javascript nmap <silent> <C-l> <Plug>(jsdoc)

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'heavenshell/vim-jsdoc'
call plug#end()

colorscheme gruvbox
set background=dark
let g:jsx_ext_required = 0

inoremap jk <ESC> :w <CR>
inoremap kj <ESC> :w <CR>
nmap rw :%s/\s\+$//<CR>

nmap <silent> <C-n> :noh<CR>
