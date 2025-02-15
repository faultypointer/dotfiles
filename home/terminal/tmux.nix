{ pkgs, inputs, ... }:{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    mouse = true;
    aggressiveResize = true;
    terminal= "xterm-256color";

    plugins = [
      { plugin = inputs.minimal-tmux.packages.${pkgs.system}.default; }
    ];

    extraConfig = ''
      set -g status off
      set -g prefix None

      bind -n C-Space set status on \;\
        switch-client -T prefix \;\
        run-shell -d 1 -b "while [ $(tmux display-message -p '##{client_prefix}') -eq 1 ]; do sleep 0.5; done; tmux set status off"

      bind Escape copy-mode
      set -s copy-command 'wl-copy'

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind-key J resize-pane -D 5
      bind-key K resize-pane -U 5
      bind-key H resize-pane -L 5
      bind-key L resize-pane -R 5
      bind N previous-window

      set-option -g pane-border-style fg=colour232
      set-option -g pane-active-border-style fg=colour235
    '';
  };
}
