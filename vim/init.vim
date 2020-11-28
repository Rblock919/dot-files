" Set Better Leader Key
let mapleader = " "

" filetype plugin indent on
syntax on

" Visual Mode Mappings

" Indent/Un-Indent Mappings
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

" Yank to system clipboard (possibly need to install vim-gtk)
vnoremap <leader>yc "+y

" Normal Mode Mappings

" Toggle Line Numbers all together
" TODO: intelligently toggle relativenumber in the case that it is already off
nnoremap <C-N> :set invrnu<CR> :set invnumber<CR>

" Toggle relative line numbers (helpful when pair programming)
nnoremap <leader>ln :set invrnu<CR>

" Coc.nvim Commands
nnoremap <silent> <leader>gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <leader>gr :call CocAction('jumpReferences')<CR>
nnoremap <silent> <leader>gy :call CocAction('jumpTypeDefinition')<CR>
nnoremap <silent> <leader>gi :call CocAction('jumpImplementation')<CR>

" Open fzf.vim In Current Project
nnoremap <leader>fz :Files<CR>

" Project Wide Search
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" Project Wide Search & Refactor
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Have Coc-Prettier Format Current File
nnoremap <leader>pff :CocCommand prettier.formatFile<CR>

" Have Coc-Eslint Fix Current File
nnoremap <leader>elf :CocCommand eslint.executeAutofix<CR>

" Easy mapping for quickfix
nnoremap <leader>qf :CocAction quickfix<CR>

" Keybind for CocRestart
nnoremap <leader>cr :CocRestart<CR><CR>

" Display yank list
nnoremap <leader>yl :<C-u>CocList -A --normal yank<CR>

" Yank current line to system clipboard
nnoremap <leader>yc "+yy

" Toggle NerdTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" Make easier window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>wv :wincmd v<CR>
nnoremap <leader>ws :wincmd s<CR>

" Move window commands
nnoremap <leader>wh :wincmd H<CR>
nnoremap <leader>wj :wincmd J<CR>
nnoremap <leader>wk :wincmd K<CR>
nnoremap <leader>wl :wincmd L<CR>

" Window resize commands
nnoremap <leader><s-y> :vertical resize +5<CR>
nnoremap <leader><s-o> :vertical resize -5<CR>
nnoremap <leader><s-u> :resize -5<CR>
nnoremap <leader><s-i> :resize +5<CR>

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

" Highlighted Color
hi Search ctermbg=LightYellow

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
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
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Use dracula Color Theme
colorscheme dracula

" Detect & Use Xresource Color Scheme
"colorscheme default

" Slightly Increase Highlight Duration On Yank
let g:highlightedyank_highlight_duration = 1750

" Set powerline fonts for vim-airline
let g:airline_powerline_fonts = 1

" Hide dist/build/node_modules directories
let g:NERDTreeIgnore = ['node_modules', 'dist', 'build']

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
