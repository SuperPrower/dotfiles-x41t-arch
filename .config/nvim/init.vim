" Behaviour
set nocompatible 			" make vim iMproved
set clipboard=unnamedplus		" use + clipboard by default

set mouse=a 				" allow mouse in all modes
set backspace=indent,eol,start 		" allow backspace to do everything

set wildmenu
set wildmode=longest,list

filetype plugin indent on

" Set persistent history and undo history/swap/backup files locations
set undofile
set undodir=~/.local/share/nvim/undo
set directory=~/.local/share/nvim/swap
set backupdir=~/.local/share/nvim/backup

set encoding=utf8

" Disable arrow keys lol
noremap <Up> 	:echo "hjkl"<CR>
noremap <Down> 	:echo "hjkl"<CR>
noremap <Left> 	:echo "hjkl"<CR>
noremap <Right>	:echo "hjkl"<CR>

" Formatting
" set autoindent
set noexpandtab
set tabstop=8
set shiftwidth=8
set linebreak
set breakindent
set showbreak=..

" Interface
set laststatus=2
" set ttimeoutlen=10
" set t_Co=16
set colorcolumn=100
set number

set nofoldenable

" Force vim to recognize .h files as C headers
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END


" =======
" Plugins
" =======
call plug#begin("~/.local/share/nvim/plugged")

	" highlighting trailing whitespaces
	Plug 'ntpeters/vim-better-whitespace'

	" cooler statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" autocompletion
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'

	Plug 'ncm2/ncm2-pyclang'
	Plug 'ncm2/ncm2-jedi'
	Plug 'ncm2/ncm2-racer'

	Plug 'ncm2/ncm2-neoinclude'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-vim'
	Plug 'ncm2/ncm2-bufword'

	Plug 'Shougo/neoinclude.vim'	" include files
	Plug 'Shougo/neosnippet.vim'	" snippets and function expansion
	Plug 'Shougo/neco-vim'		" vim configuration

	" ctags
	Plug 'ludovicchabant/vim-gutentags'

	" linting
	" Plug 'w0rp/ale'

	" syntax highlighting
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
	Plug 'baskerville/vim-sxhkdrc'
	Plug 'octol/vim-cpp-enhanced-highlight'

	" latex
	Plug 'donRaphaco/neotex', {'for': 'tex'}

	" file tree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" ============
" Key Bindings
" ============
nnoremap <F7>  :StripWhitespace<CR>

" ===========
" Colorscheme
" ===========
" Setting dark mode
set background=dark

" ====================
" Vim Airline Settings
" ====================
let g:airline_powerline_fonts=1
let g:airline_theme="bubblegum"

" Custom Symbols
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif

let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.whitespace=''
" Custom right-most part
call airline#parts#define_raw('line', (g:airline_symbols.linenr).' %#__accent_bold#%l/%L%#__restore__#')
let g:airline_section_z=airline#section#create(['line',':%v'])

" Get rid of default mode indicator
set noshowmode

" =============
" ncm2 settings
" =============

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

" suppress completion messages
set shortmess+=c

let g:ncm2#complete_length = [[1, 3], [7, 2], [8, 3]]

au TextChangedI * call ncm2#auto_trigger()

" ===================
" neosnippet settings
" ===================

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

let g:neosnippet#snippets_directory = "~/.config/nvim/snippets/"

" use tab to select pop-up menu - ncm/deoplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" If snippet is expandable, expand it on Enter, else insert new line
" works bad without ncm2 support, wait for https://github.com/ncm2/ncm2/issues/31
" imap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "\<Plug>(neosnippet_expand)" : "\<CR>"

" If there is a tag, jump to it on Ctrl+J
imap <expr><C-j> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-j>"
smap <expr><C-j> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-j>"

" ================================================
" LaTeX specific settings
" check ./after/ftplugin/tex.vim for more settings
" ================================================
let g:neotex_enabled = 1
