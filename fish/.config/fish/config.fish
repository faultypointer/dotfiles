# --- Aliases ---
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias vim="emacsclient -t"

# --- Starship ---
starship init fish | source

# --- Zoxide ---
zoxide init fish | source

# --- Cargo ---
fish_add_path ~/.cargo/bin
fish_add_path ~/.emacs.d/bin

set -Ux EDITOR vim
