filetype plugin on

set autochdir

set autoindent
set number
" set nowrap

" for hard wrapping text
set textwidth=80
set formatoptions+=t

" for soft wrapping text
" set wrap
" set linebreak
" set nolist

set tabstop=4
set expandtab
syntax on
set background=light
colorscheme molokai

" inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" enable 256 colour support
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

" switch off colorscheme background colors
hi Normal ctermbg=none
hi LineNr ctermbg=none

" dark bg
set background=dark

set backspace=2

set cryptmethod=blowfish

set ruler

set rnu
