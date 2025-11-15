# --- Aliases ---
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# --- Starship ---
starship init fish | source

# --- Zoxide ---
zoxide init fish | source

# --- Cargo ---
# If env.fish exists:
if test -e ~/.cargo/env.fish
    source ~/.cargo/env.fish
else
    set -Ux PATH $PATH ~/.cargo/bin
end

# --- Extra PATH additions ---
set -Ux PATH $PATH /home/faulty/.emacs.d/bin/

