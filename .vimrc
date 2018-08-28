call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'joshdick/onedark.vim'

call plug#end()

if has("termguicolors")
    set termguicolors
    " for tmux
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
    let g:onedark_termcolors=16
endif

syntax on

let g:airline_theme='onedark'
colorscheme onedark

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

set fenc=utf-8
set nobackup
set noswapfile

" display

set showcmd

set number
set relativenumber
set cursorline
set cursorcolumn
set colorcolumn=80

set scrolloff=3
" 

set virtualedit=onemore
set whichwrap=b,s,h,l,<,>,[,],~

set mouse=a

set ttimeoutlen=10

" Tab, Indent

set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent


"" nnoremap <S-Tab> <<
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>
