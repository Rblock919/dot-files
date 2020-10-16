" Set Better Leader Key
let mapleader = " "

" filetype plugin indent on
syntax on

" Visual Mode Mappings
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Insert Mode Mappings
" I want my damn closing characters
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ` ``<Esc>i
" TODO: find way to delete 2nd character if first is deleted
" TODO: find way to 'type-through' 2nd character

" Normal Mode Mappings
nmap <C-N> :set invrnu<CR> :set invnumber<CR>

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

" Easy mapping for quickfix
nmap <leader>qf :CocAction quickfix<CR>

" Keybind for CocRestart
nmap <leader>cr :CocRestart<CR><CR>

" Display yank list
nmap <leader>yl :<C-u>CocList -A --normal yank<CR>

" Make easier window commands
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>wv :wincmd v<CR>
nmap <leader>ws :wincmd s<CR>

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

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-yank'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'herringtondarkholme/yats.vim'
Plug 'jparise/vim-graphql'

call plug#end()

" Use dracula Color Theme
colorscheme dracula

" Detect & Use Xresource Color Scheme
"colorscheme default

" Slightly Increase Highlight Duration On Yank
let g:highlightedyank_highlight_duration = 1750

" Set powerline fonts for vim-airline
let g:airline_powerline_fonts = 1

" Set Popup Window Mode and Color Scheme For fzf Search
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse --color fg:255,bg:236,hl:84,fg+:255,bg+:236,hl+:215 --color info:141,prompt:84,spinner:212,pointer:212,marker:212'

" Redefine the Files command to have a preview window
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Prefer // <code> over /* <code> */ for commentary plugin
autocmd FileType typescript setlocal commentstring=//\ %s
autocmd FileType javascript setlocal commentstring=//\ %s

" Allow tab to traverse options in auto-complete window, refresh on backspace
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Check if backspace was just pressed
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Allow pressing enter on auto-completed suggestions to trigger any needed actions (such as an import statement)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
