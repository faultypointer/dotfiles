# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=200
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/faulty/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(zoxide init zsh)"
alias cd="z"


# git stuff
alias gcm="git commit -m"
alias gcv="git commit -v"
alias gue="git config user.email"
alias gun="git config user.name"
alias gud="gue faultypointer@proton.me && gun faultypointer"
