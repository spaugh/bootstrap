set nocompatible
"if you call filetype off with filetype not being on first, vim exits with
"non zero exit code. So, we turn it on first just in case
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"My bundles:
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'

" without this, backspace will sometimes not work at eol
set backspace=indent,eol,start

set autoread
au! CursorMoved * checktime
au! CursorMovedI * checktime

"set tabs to 4 spaces unless we're in an html file
set tabstop=4
set shiftwidth=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2

"turn on search highlighting
set hlsearch

"Turn syntax highlighting on - 'enable' allows custom highling
syntax enable

"Turn on language specific indenting
filetype plugin indent on

"Set solarized colorscheme
set background=dark
colorscheme solarized

"tabs dont automatically convert to spaces
set noexpandtab

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

"Wrap lines if they are longer than screen width
set nowrap

"Ctrl+n to turn off highlighting
nmap <silent> <C-n> :noh<CR>

"~~~~~~ Abbreviations ~~~~~~~
imap kj <Esc> :w <CR>
nmap rw :%s/\s\+$//<CR>

" C++ abbrev
ia ic #include <Left>
ia ss std::string
ia sv std::vector<><Left>
ia sm std::map<><Left>
ia sd std::
ia sc std::cout <<
ia sp std::pair<><Left>

"~~~~~ Autocommands ~~~~~~~~~

"Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
	function! MyTabLine()
		let s = ''
		let wn = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' .  i .  'T'
			let s .= (i == t ?  '%1*' : '%2*')
			let s .= ' '
			let wn = tabpagewinnr(i,'$')
			let s .= '%#TabNum#'
			let s .= i
			" let s .= '%*'
			let s .= (i == t ?  '%#TabLineSel#' : '%#TabLine#')
			let bufnr = buflist[winnr - 1]
			let file = bufname(bufnr)
			let buftype = getbufvar(bufnr, 'buftype')
			if buftype == 'nofile'
				if file =~ '\/.'
					let file = substitute(file, '.*\/\ze.', '', '')
				endif
			else
				let file = fnamemodify(file, ':p:t')
			endif
			if file == ''
				let file = '[No Name]'
			endif
			let s .= ' ' .  file .  ' '
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ?  '%999XX' : 'X')
		return s
	endfunction
	set stal=2
	set tabline=%!MyTabLine()
	set showtabline=1
	highlight link TabNum Special
endif

"quick search for Spiral code
nmap py :execute ":vimgrep /" . input("search[python/]: ") . "/j ~/repo/spiral/python/**/*.py" <Bar> cw<CR>
nmap sc :execute ":vimgrep /" . input("search[modules/]: ") . "/j ~/repo/spiral/modules/**/*.cpp" <Bar> cw<CR>
nmap sh :execute ":vimgrep /" . input("search[modules/]: ") . "/j ~/repo/spiral/modules/**/*.h" <Bar> cw<CR>
