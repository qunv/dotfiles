set -o vi
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    fzf
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim

# cp -R ~/dotfiles/.config/nvim/* ~/.config/nvim/

# export kubectl
export KUBECONFIG=$(find ~/.kube/clusters -type f | sed ':a;N;s/\n/:/;ba')

unalias -a
source $HOME/dotfiles/.myfzf
source $HOME/dotfiles/.bash_alias

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

zle -N edit-command-line
bindkey -M vicmd v edit-command-line

if command -v tmux &> /dev/null && [ -n "$PS1"  ] && [[ ! "$TERM" =~ screen  ]] && [[ ! "$TERM" =~ tmux  ]] && [ -z "$TMUX"  ]; then
  exec tmux
fi
