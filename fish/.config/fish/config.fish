zoxide init fish | source
starship init fish | source

if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

set -gx INFOPATH $INFOPATH /usr/share/info/emacs
