export FZF_DEFAULT_OPTS="--height 70% --reverse"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

##################
##### git ########
##################
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gb() {
  is_in_git_repo || return

  local branches target
  branches=$(
    git branch --all | grep -v HEAD | sed "s/.* //" | sed "s#remotes/[^/]*/##" | sort -u | awk '{print $1}'
  ) || return
  target=$(echo "$branches" | fzf --no-hscroll --no-multi --delimiter="\t" -n 2 --ansi) || return
  echo $(echo "$target" | awk -F "\t" '{print $1}')
}

gt() {
  is_in_git_repo || return
  local tags branches target
  tags=$(git tag | awk '{print $1}') || return
  target=$(echo "$tags" | fzf --no-hscroll --no-multi --delimiter="\t" -n 2 --ansi) || return
  echo $(echo "$target" | awk -F "\t" '{print $1}')
}

gco() {
  is_in_git_repo || return
  git checkout $(git-branch-fzf)
}

glo() {
  is_in_git_repo || return

  _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
  _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"
  git log --graph --color=always \
    --format="%C(auto)%h%d [%an] %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --preview="$_viewGitLogLine" \
      --bind "ctrl-m:execute:
		(grep -o '[a-f0-9]\{7\}' | head -1 |
		xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
		{}
FZF-EOF"
}

grbi() {
  is_in_git_repo || return
  local commits
  commits=$(git log --oneline --graph --color=always | fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort)
  git rebase -i $(echo "$commits" | head -n1 | cut -d " " -f2)
}
