alias s=source

git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2>/dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return
    ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

alias g=git
alias gcl='git clone'
alias ga='git add'
alias ga.='git add .'
#alias gb='git branch'
alias gcm='git commit -m'
alias gcb='git checkout -b'
#alias gco='git checkout'
alias gcp='git cherry-pick'
alias gfa='git fetch -a'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias gpushf='git push --force origin $(git_current_branch)'
alias gpull='git pull'
#alias glo='git log --oneline'
alias gm='git merge'
alias gpush='git push'
alias grb='git rebase $(gb)'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
#alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grh='git reset --hard'
alias grs='git reset --soft HEAD~1'
alias gst='git status'

alias k='kubectl'
alias kgp='kubectl get pod'
alias kgd='kubectl get deployment'
alias klf='kubectl logs -f $(echo $(kgp | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kdp='kubectl describe pods $(echo $(kgp | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kdlp='kubectl delete pod $(echo $(kgp | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kdld='kubectl delete deployment $(echo $(kgd | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kgi='kubectl get ingress'
alias kgs='kubectl get secret'
alias kes='kubectl edit secrets $(echo $(kgs | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kexe='kubectl exec -it $(echo $(kgp | sed "1d" | fzf) |  head -n1 | cut -d " " -f1) -- bash'
alias kgcm='kubectl get configmap'
alias kecm='kubectl edit configmap $(echo $(kgcm | sed "1d" | fzf) |  head -n1 | cut -d " " -f1)'
alias kc='kubectx'
alias kns='kubens'

alias yss='yay -Ss'
alias ys='yay -S'
alias yRns='yay -Rns'
alias pSyu='sudo pacman -Syu'

alias dc='docker'
alias dpsa='docker ps -a'
alias dil='docker image ls'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dri='docker images | sed '1d' | fzf -m | awk '{print $3}' | xargs docker rmi'
alias drc='docker ps -a | sed '1d' | fzf -m | awk '{print $1}' | xargs docker rm -v'
alias dthanos='docker system prune -f --all --volumes'