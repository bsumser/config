set number
set tabstop=4
set noswapfile	

nnoremap <Space> i_<Esc>r
nmap <F6> :NERDTreeToggle<CR>

imap jk <Esc>


call plug#begin('~/.vim/plugged')

" vim theme plugin
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'mechatroner/rainbow_csv'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end() 

set background=dark
"set background=light

colorscheme gruvbox
let g:airline_theme='gruvbox'

if &term =~ '256color'
	    set t_ut=
endif
