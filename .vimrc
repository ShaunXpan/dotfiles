set nocompatible              " be iMproved, required

filetype on 
filetype indent on
filetype plugin on
filetype plugin indent on
let mapleader = ","
set encoding=utf-8
set clipboard+=unnamedplus

set number
syntax enable   " enable syntax processing
set relativenumber
set cursorline          " highlight current line
set wrap
set showcmd
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

set hlsearch            " highlight matches
exec "nohlsearch"
set incsearch           " search as characters are entered
set ignorecase
set smartcase
set scrolloff=5


map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


"noremap J 5j
noremap K 5k

noremap n nzz
noremap N Nzz


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]
" jk is escape
nmap <leader>yy !pbcopy<CR><CR>
inoremap jk <esc>
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

"dire Capo

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim',
Plug 'vim-airline/vim-airline',
"Plug 'theniceboy/eleline.vim'
"Plug 'bling/vim-bufferline'
"Plug 'ajmwagar/vim-deus',
Plug 'morhetz/gruvbox',
" Auto Complete
Plug 'ycm-core/YouCompleteMe'
Plug 'jaxbot/semantic-highlight.vim'

" Error checking
Plug 'w0rp/ale'
Plug 'mg979/vim-xtabline'
"Plug 'drewtempelmeyer/palenight.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Undo Tree
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
call plug#end()

" ========
" 
                        _               
  __ _ _ __ _   ___   _| |__   _____  __
 / _` | '__| | | \ \ / / '_ \ / _ \ \/ /
| (_| | |  | |_| |\ V /| |_) | (_) >  < 
 \__, |_|   \__,_| \_/ |_.__/ \___/_/\_\
 |___/                                  
" ========
color gruvbox



" ========
" 
 _   _ _____ ____  ____ _____              
| \ | | ____|  _ \|  _ \_   _| __ ___  ___ 
|  \| |  _| | |_) | | | || || '__/ _ \/ _ \
| |\  | |___|  _ <| |_| || || | |  __/  __/
|_| \_|_____|_| \_\____/ |_||_|  \___|\___|
                                           
" ========
map <LEADER>f :NERDTreeToggle<CR>


" ========
" Other ussefull trick
" ========
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l


" ===
" 
 _____ __________ 
|  ___|__  /  ___|
| |_    / /| |_   
|  _|  / /_|  _|  
|_|   /____|_|    
                  
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
noremap <C-p> :FZF<CR>
