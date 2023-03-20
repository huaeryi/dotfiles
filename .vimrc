"------
" Help
"------
" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

" not vi compatible
set nocompatible

"------------------
" Syntax and indent
"------------------

" Turn on syntax highlighting.
syntax on
" show matching braces when text indicator is over them
set showmatch
" enable file type detection
filetype plugin indent on
" auto indent
set autoindent

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" set colorscheme
colorscheme molokai  
set t_Co=256
set background=dark

"---------------------
" Basic editing config
"---------------------

" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" highlight search
set hlsearch
" set list to see tabs and non-breakable spaces
set listchars=tab:>>,nbsp:~
" line break
set linebreak
" show lines above and below cursor (when possible)
set scrolloff=5
" set numberwidth
set numberwidth=4
" This enables relative line numbering mode. With both number and relativenumber
""set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" allow backspace over anything.
set backspace=indent,eol,start
" fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100
" skip redrawing screen in some cases
set lazyredraw
" automatically set current directory to directory of last opened file
set autochdir
" allow auto-hiding of edited buffers
set hidden
" more history
set history=8192
" suppress inserting two spaces between sentences
set nojoinspaces
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
" enable mouse mode (scrolling, selection, etc)
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
" disable folding by default
set nofoldenable
" show command
set showcmd

"--------------------
" Misc configurations
"--------------------

" Unbind some useless/annoying default key bindings.
map <C-a> <Nop>
map <C-x> <Nop>
" 'q' in normal mode enters ex mode. you almost never want this.
nmap Q <Nop> 

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Try to prevent bad habits like using the arrow keys for movement. 
" how to prevent the latter.
" Do this in normal mode...
"nnoremap <Left>  :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up>    :echoe "Use k"<CR>
"nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>

"把df映射为<ESC>
"map <Caps_lock> <ESC>
map  df <Esc>
omap df <Esc>
imap df <Esc>
cmap df <Esc>


"---------------------
" Plugin configuration
"---------------------

" Plug
call plug#begin()
Plug 'scrooloose/nerdtree'
"Plug 'vim-jp/vim-cpp'
Plug 'valloric/youcompleteme'
" Plug 'wikitopian/hardmode'  
call plug#end()

" Config for youcompleteme
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" ctrlp
set runtimepath^=~/.vim/pack/vendor/start/ctrlp.vim
let g:ctrlp_map ='<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' 

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

