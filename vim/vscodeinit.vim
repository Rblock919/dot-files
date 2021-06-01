" Set Better Leader Key
let mapleader = " "

syntax on
filetype plugin indent on

"" Visual Mode Mappings

" Indent/Un-Indent Mappings
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Yank to system clipboard
vnoremap <leader>yc "+y

"" Normal Mode Mappings

" Yank current line to system clipboard
nnoremap <leader>yc "+yy

" Toggle relative line numbers (helpful when pair programming)
nnoremap <leader>rl :set invrnu<CR>

nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" Settings
set number showmode
set t_Co=16
set modeline
set softtabstop=2
set shiftwidth=2
" Do not wrap text to next 'line', make it bump off screen
set nowrap
" Autocomplete directories and files
set wildmode=list:longest
" Use spaces instead of tabs
set expandtab 
set hlsearch
set undodir=~/.config/nvim/undodir
set undofile
set showcmd
set backspace=indent,eol,start
set noswapfile
set nobackup
set incsearch
set relativenumber
set modeline

" Prefer // <code> over /* <code> */ for commentary plugin
autocmd FileType typescript setlocal commentstring=//\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
