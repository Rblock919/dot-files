" Set Better Leader Key
let mapleader = " "

" filetype plugin indent on
syntax on

" Normal Mode Mappings
nmap <C-N> :set invnumber<CR>
"nmap <CR> G

" Visual Mode Mappings
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Insert Mode Mappings
"imap <S-Tab> <C-P>
" map ctrl+space to auto complete suggestions
"imap <C-@> <C-P>

" Coc.nvim Commands
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)

" Open fzf.vim In Current Project
nmap <leader>fz :Files<CR>

" Project Wide Search
nmap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Project Wide Search & Refactor
nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Have Coc-Prettier Format Current File
nmap <leader>pff :CocCommand prettier.formatFile<CR>

" Have Coc-Eslint Fix Current File
nmap <leader>elf :CocCommand eslint.executeAutofix<CR>

" Make easier window commands
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>wv :wincmd v<CR>
nmap <leader>ws :wincmd s<CR>

" Display yank list
nmap <leader>yl :<C-u>CocList -A --normal yank<CR>

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
set undodir=/home/ryan/.vim/undodir
set undofile
set showcmd
set backspace=indent,eol,start
set noswapfile
set nobackup
set incsearch
set relativenumber

" Highlighted Color
hi Search ctermbg=LightYellow

" Abbreviations
":iab impt import {} from '';
":iab cnsl console.log();

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-yank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jlanzarotta/bufexplorer'

call plug#end()

" Use dracula Color Theme
colorscheme dracula

" Detect & Use Xresource Color Scheme
"colorscheme default

" Slightly Increase Highlight Duration On Yank
let g:highlightedyank_highlight_duration = 1750

" Set Popup Window Mode and Color Scheme For fzf Search
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse --color fg:255,bg:236,hl:84,fg+:255,bg+:236,hl+:215 --color info:141,prompt:84,spinner:212,pointer:212,marker:212'

" Redefine the Files command to have a preview window
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Prefer // <code> over /* <code> */ for commentary plugin
autocmd FileType typescript setlocal commentstring=//\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
