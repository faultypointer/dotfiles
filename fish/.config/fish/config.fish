# --- Aliases ---
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias vim="emacsclient -t"
alias ca=cargo

# --- Starship ---
starship init fish | source

# --- Zoxide ---
zoxide init fish | source

# --- Cargo ---
fish_add_path ~/.cargo/bin
fish_add_path ~/.emacs.d/bin
fish_add_path ~/bin

set -Ux EDITOR nvim
