filetype off
filetype plugin indent on
call plug#begin('~/.vim/plugged')

Plug 'moll/vim-bbye'
Plug 'godlygeek/tabular'
Plug 'yegappan/mru'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'                                                           " Helpers for UNIX
Plug 'romainl/vim-cool'                                                           " Search highlight more useful.
Plug 'junegunn/vim-peekaboo'                                                      " Peek content of the registers
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mlaursen/vim-react-snippets'
Plug 'relastle/vim-nayvy'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'

call plug#end()

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set ruler
set encoding=utf-8

set backspace=indent,eol,start

set history=1000
set showcmd
set showmode
set number
set relativenumber

set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set incsearch
set hlsearch
set wrap
set linebreak

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

set foldmethod=indent
set foldnestmax=33
set nofoldenable

set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*~

set formatoptions-=o

set scrolloff=3
set sidescrolloff=7
set sidescroll=1

syntax on

set hidden

set ignorecase
set smartcase

" Nerdtree setup
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '\.idea'] " ignore files in nerd tree

" Use the Linux system clipboard for normal yank/delete/change/put operations.
" Prefer Wayland's wl-clipboard, with xclip as an X11 fallback.
function! s:ClipboardProviderAvailable() abort
    return (executable('wl-copy') && executable('wl-paste')) || executable('xclip')
endfunction

function! s:ClipboardCopy(reg, type, lines) abort
    let l:text = join(a:lines, "\n")
    if a:type[0] ==# 'V'
        let l:text .= "\n"
    endif

    if executable('wl-copy') && executable('wl-paste')
        call system('wl-copy', l:text)
    elseif executable('xclip')
        call system('xclip -selection clipboard -in', l:text)
    endif
endfunction

function! s:ClipboardPaste(reg) abort
    if executable('wl-copy') && executable('wl-paste')
        let l:text = system('wl-paste --no-newline')
    elseif executable('xclip')
        let l:text = system('xclip -selection clipboard -out')
    else
        return ['', []]
    endif

    return ['', split(l:text, "\n", 1)]
endfunction

if has('clipboard_provider') && s:ClipboardProviderAvailable()
    let v:clipproviders['system'] = {
        \ 'available': function('s:ClipboardProviderAvailable'),
        \ 'copy': {'+': function('s:ClipboardCopy'), '*': function('s:ClipboardCopy')},
        \ 'paste': {'+': function('s:ClipboardPaste'), '*': function('s:ClipboardPaste')},
        \ }
    set clipmethod^=system
    set clipboard=unnamedplus
elseif has('unnamedplus')
    set clipboard=unnamedplus
endif

" Convenience mappings; plain y/p also use the system clipboard when available.
vnoremap <C-c> "+y
vmap <C-y> :%y+<CR>

colorscheme onehalfdark 
