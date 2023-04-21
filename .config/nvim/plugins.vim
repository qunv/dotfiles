call plug#begin('~/.vim/plugged')

""" Tools
Plug 'moll/vim-bbye'
Plug 'godlygeek/tabular'                                                          " Text filtering and alignment
Plug 'yegappan/mru'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-eunuch'                                                           " Helpers for UNIX
Plug 'romainl/vim-cool'                                                           " Search highlight more useful.
Plug 'junegunn/vim-peekaboo'                                                      " Peek content of the registers
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'

""" Code
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'mlaursen/vim-react-snippets'

Plug 'puremourning/vimspector'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dense-analysis/ale'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
endif

" Plug 'lifepillar/vim-mucomplete'
""" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()
