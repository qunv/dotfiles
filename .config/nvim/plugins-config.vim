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

" deocomplete""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 0
"
"function! Multiple_cursors_before()
"    let b:deoplete_disable_auto_complete = 1
"endfunction
"
"function! Multiple_cursors_after()
"    let b:deoplete_disable_auto_complete = 0
"endfunction
""""""""""""""""""""""""""

"nerdtree settings
" autocmd vimenter * NERDTree | wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 40
let g:NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

" nnoremap <silent> <leader>1 :NERDTreeToggle %<CR>
nnoremap <silent> <leader>1 :call NERDTreeToggleInCurDir()<cr>

"explorer mappings
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
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$', '\.DS_Store$', '\.git$']

 autocmd FileType python let b:coc_root_patterns = ['.git']

nnoremap <leader>t :FloatermNew<CR>
nnoremap <leader>q :Bdelete<CR>

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:nayvy_coc_completion_icon='✡ nayvy'

let g:vimspector_enable_mappings = 'HUMAN'
