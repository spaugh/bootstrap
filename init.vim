call plug#begin('~/.vim/plugged')
  Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox

if (has("termguicolors"))
  set termguicolors "True color support
endif

set number "Turn on line numbers
set nowrap "Don't wrap long lines

"Allow exiting insert mode by quickly tapping k and j keys in either order
inoremap jk <ESC> :w <CR>
inoremap kj <ESC> :w <CR>

"Turn off highlighting from previous search
nmap <silent> <C-n> :noh<CR>
