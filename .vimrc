set nocompatible              " be iMproved, required
filetype off                  " required
filetype indent on
filetype plugin on
filetype plugin indent on
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
set encoding=utf-8
set clipboard=unnamed
inoremap jk <Esc>
set number
syntax enable   " enable syntax processing
set relativenumber
set cursorline          " highlight current line
set wrap
set showcmd
set wildmenu
set showmatch
set autowrite

set hlsearch            " highlight matches
exec "nohlsearch"
set incsearch           " search as characters are entered
set ignorecase          " case insensitive
set smartcase
set scrolloff=5
set backspace=2

map R :source $MYVIMRC <CR>

map sl :set splitright <CR> :vsplit <CR>
map sh :set nosplitright <CR> :vsplit <CR>
map sj :set splitbelow <CR> :split <CR>
map sk :set nosplitbelow <CR> :split <CR>

map <Leader>j <c-w>j
map <Leader>k <c-w>k
map <Leader>h <c-w>h
map <Leader>l <c-w>l

map <Up> :resize+5 <CR>
map <Down> :resize-5 <CR>
map <Left> :vertical resize-5 <CR>
map <Right> :vertical resize+5 <CR>

"tab motions
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
"nnoremap <C-d> :bdelete<CR>
"nnoremap <C-N> :tabnew<CR>
"nnoremap th  :tabfirst<CR>
"nnoremap tk  :tabnext<CR>
"nnoremap tj  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>

map tn :tabe <CR>
map th :-tabnext <CR>
map tl :+tabnext <CR>

"noremap J 5j
noremap K 5k
"disable it in order to compatible with ideavim
"noremap n nzz
"noremap N Nzz

noremap j gj
noremap k gk

"vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
" yank to clipboard
"if has("clipboard")
"  set clipboard=unnamed " copy to the system clipboard
"
"  if has("unnamedplus") " X11 support
"    set clipboard+=unnamedplus
"  endif
"endif

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vmap y y`]

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces


" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" highlight last inserted text
nnoremap gV `[v`]



" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'mileszs/ack.vim'
"Plugin 'ycm-core/YouCompleteMe'
"Plugin 'ervandew/supertab'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"let localmapleader = "\<Space>"
"let g:go_list_type = "quickfix"


"
"auto input and jump out
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
""inoremap { {<CR>}<ESC>O

function! RemovePairs()
    let s:line = getline(".")
    let s:previous_char = s:line[col(".")-1]

    if index(["(","[","{"],s:previous_char) != -1
        let l:original_pos = getpos(".")
        execute "normal %"
        let l:new_pos = getpos(".")
        " only right (
        if l:original_pos == l:new_pos
            execute "normal! a\<BS>"
            return
        end

        let l:line2 = getline(".")
        if len(l:line2) == col(".")
            execute "normal! v%xa"
        else
            execute "normal! v%xi"
        end
    else
        execute "normal! a\<BS>"
    end
endfunction

function! RemoveNextDoubleChar(char)
    let l:line = getline(".")
    let l:next_char = l:line[col(".")]

    if a:char == l:next_char
        execute "normal! l"
    else
        execute "normal! i" . a:char . ""
    end
endfunction

""inoremap <BS> <ESC>:call RemovePairs()<CR>a
""inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
""inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
""inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
"inoremap > <ESC>:call RemoveNextDoubleChar('>')<CR>a
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

""map <C-n> :cnext<CR>
""map <C-m> :cprevious<CR>
""nnoremap <leader>a :cclose<CR>

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ycm-core/YouCompleteMe'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'w0rp/ale'
Plug 'mg979/vim-xtabline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'python-mode/python-mode', {'for' : 'python', 'branch': 'develop'}
Plug 'majutsushi/tagbar'


"color
Plug 'morhetz/gruvbox'
call plug#end()

"=====================================       _                             
"__   _(_)_ __ ___         __ _  ___  
"\ \ / / | '_ ` _ \ _____ / _` |/ _ \ 
" \ V /| | | | | | |_____| (_| | (_) |
"  \_/ |_|_| |_| |_|      \__, |\___/ 
"                         |___/       
"=====================================       _                             

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 0
"let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"let g:go_def_mode = 'godef'
let g:go_def_mode = 'gopls'
let g:go_info_mode='gopls'
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"

"========================================================
"       _                       _      _ _            
"__   _(_)_ __ ___         __ _(_)_ __| (_)_ __   ___ 
"\ \ / / | '_ ` _ \ _____ / _` | | '__| | | '_ \ / _ \
" \ V /| | | | | | |_____| (_| | | |  | | | | | |  __/
"  \_/ |_|_| |_| |_|      \__,_|_|_|  |_|_|_| |_|\___|
"                                                     
"========================================================
" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2

"fuzzy navigating through the open buffers
nmap <Leader>b :CtrlPBuffer<CR>

"======================================
"                    _ _                 
" _ __   ___ _ __ __| | |_ _ __ ___  ___ 
"| '_ \ / _ \ '__/ _` | __| '__/ _ \/ _ \
"| | | |  __/ | | (_| | |_| | |  __/  __/
"|_| |_|\___|_|  \__,_|\__|_|  \___|\___|
"                                        
"======================================
"tree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <Leader>f :NERDTreeToggle<CR>

"max/min split window
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mkkession! " . s:maximize_session
    only
  endif
endfunction

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

"===============================
"                        _               
"  __ _ _ __ _   ___   _| |__   _____  __
" / _` | '__| | | \ \ / / '_ \ / _ \ \/ /
"| (_| | |  | |_| |\ V /| |_) | (_) >  < 
" \__, |_|   \__,_| \_/ |_.__/ \___/_/\_\
" |___/                                  
"===============================

"color gruvbox

"========================================
"                 _       _         _ 
" _ __ ___   ___ | | ___ | | ____ _(_)
"| '_ ` _ \ / _ \| |/ _ \| |/ / _` | |
"| | | | | | (_) | | (_) |   < (_| | |
"|_| |_| |_|\___/|_|\___/|_|\_\__,_|_|
"                                     
"========================================
"
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

"========================================
"                                  _ _   _           _           
" _   _  ___ _ __ ___        _   _| | |_(_)___ _ __ (_)_ __  ___ 
"| | | |/ __| '_ ` _ \ _____| | | | | __| / __| '_ \| | '_ \/ __|
"| |_| | (__| | | | | |_____| |_| | | |_| \__ \ | | | | |_) \__ \
" \__, |\___|_| |_| |_|      \__,_|_|\__|_|___/_| |_|_| .__/|___/
" |___/                                               |_|        
"========================================

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = "<tab>"
"
" "better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

"========================================
"
"  ____ _        _             
" / ___| |_ _ __| |      _ __  
"| |   | __| '__| |_____| '_ \ 
"| |___| |_| |  | |_____| |_) |
" \____|\__|_|  |_|     | .__/ 
"                       |_|    
"========================================
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"========================================
" 
" _              _                
"| |_ __ _  __ _| |__   __ _ _ __ 
"| __/ _` |/ _` | '_ \ / _` | '__|
"| || (_| | (_| | |_) | (_| | |   
" \__\__,_|\__, |_.__/ \__,_|_|   
"          |___/                  
"

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>
nmap <Leader>tb :TagbarToggle<CR>
