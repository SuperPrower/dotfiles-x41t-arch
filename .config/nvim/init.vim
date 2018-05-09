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

" use tab to select pop-up menu - ncm/deoplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" disable mode because lightline does that
set noshowmode

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

	" syntax highlighting
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }

	" cooler statusbar
	Plug 'itchyny/lightline.vim'

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



" ===================
" neosnippet settings
" ===================

" let g:neosnippet#enable_completed_snippet = 1
" let g:neosnippet#disable_runtime_snippets = {
" \   '_' : 1,
" \ }
"
" let g:neosnippet#snippets_directory = "~/.config/nvim/snippets/"
"
" " If snippet is expandable, expand it on Enter, else insert new line
" imap <expr><CR>  (pumvisible() && neosnippet#expandable()) ? "\<Plug>(neosnippet_expand)" : "\<CR>"
"
" imap <expr><C-j> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"
" smap <expr><C-j> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<C-j>"

" ================================================
" LaTeX specific settings
" check ./after/ftplugin/tex.vim for more settings
" ================================================
" let g:neotex_enabled = 1
