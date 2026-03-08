# --- Aliases ---
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias vim="helix"
# cargo aliases
alias ca=cargo
alias car="ca r"
alias ccc="clang -Wall -Wextra -Werror -std=c23"
# git aliases
alias gipu="git push"
alias gipl="git pull"
alias gico="git checkout"
alias gira="git remote add"
# others
# alias download_torrent="webtorrent '$(wl-paste)'"

# --- Starship ---
starship init fish | source

# --- Zoxide ---
zoxide init fish | source

# --- Cargo ---
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.emacs.d/bin
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path ~/.config/herd-lite/bin/
fish_add_path ~/Desktop/odin
set -Ux EDITOR vim

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/faulty/.ghcup/bin # ghcup-env

direnv hook fish | source

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/faulty/.opam/opam-init/init.fish' && source '/home/faulty/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration
