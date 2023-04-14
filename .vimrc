set number
set tabstop=4
set shiftwidth=4
set noswapfile
set foldmethod=manual

set listchars=tab:\|\  
set list

let g:tex_conceal = ""

nnoremap <Space> i_<Esc>r
nmap <F6> :NERDTreeToggle<CR>

imap jk <Esc>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

call plug#begin('~/.vim/plugged')

" vim theme plugin
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox' " gruvbox colorscheme
Plug 'scrooloose/nerdtree' " filesystem tree in vim
Plug 'mechatroner/rainbow_csv' " color for csv files
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline-themes'

" plugin for git info
Plug 'tpope/vim-fugitive'

" vertical line dashes showing text indentation
Plug 'Yggdroot/indentLine'

call plug#end()

set background=dark
"set background=light

" airline stuff
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


if &term =~ '256color'
	    set t_ut=
endif
