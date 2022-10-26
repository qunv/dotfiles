colorscheme onehalfdark

"plantuml conf
let g:plantuml_executable_script = "$HOME/.vim/plantuml/uml.sh"

"vim-gist settings
let g:gist_post_private = 1
let g:gist_browser_command = 'sensible-browser %URL%'

"add new words (via zg) here
setlocal spellfile+=~/.vim/spell/en.utf-8.add
"syntastic settings
let syntastic_stl_format = '[Syntax: %E{line:%fe }%W{#W:%w}%B{ }%E{#E:%e}]'
let g:ctrlp_user_command = 'fd --type f --hidden --exclude .git'

"nerdtree settings
" autocmd vimenter * NERDTree | wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$'] " ignore files in nerd tree

nnoremap <leader>1 :NERDTreeToggle %<CR>

"explorer mappings
nnoremap <f4> :NERDTreeFind<cr>
nnoremap <c-f> :CtrlP<cr>

"ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets = "<c-s>"


"tmux-vim-navigator setup
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <m-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <m-j> :TmuxNavigateDown<cr>
nnoremap <silent> <m-k> :TmuxNavigateUp<cr>
nnoremap <silent> <m-l> :TmuxNavigateRight<cr>
nnoremap <silent> <m-w> :TmuxNavigatePrevious<cr>

" latex
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
" filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
"
" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let g:alchemist_tag_disable = 1
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

 " coc-python settings
 let g:python_host_prog = '/usr/bin/python3'
 let g:python3_host_prog = '/usr/bin/python3'

 let g:snips_author='kpanic'
 let g:snips_email='anhptvolga@yandex.ru'
 let g:snips_github='https://github.com/anhptvolga'
 autocmd FileType python let b:coc_root_patterns = ['.git']

nnoremap <leader>ot :FloatermNew<CR>
nnoremap <leader>q :Bdelete<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:nayvy_coc_completion_icon='✡ nayvy'

let g:vimspector_enable_mappings = 'HUMAN'
