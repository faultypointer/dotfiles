{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    
    ./apps/neovim
  ];
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-light-soft;

  home.username = "faulty";
  home.homeDirectory = "/home/faulty";
  

  home.packages = with pkgs; [
    neofetch

    zip
    xz
    unzip
    p7zip

    ripgrep
    eza
    fzf
    xclip

    file
    which
    tree
    gnupg

    usbutils

    nerdfonts
    wezterm
    beeper
    strawberry
    
    gnumake
    cmake
    gitui

    obsidian
    logseq
  ];

  programs.git = {
    enable = true;
    userName = "faultypointer";
    userEmail = "faultypointer@proton.me";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        # draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      z = "zoxide";
      cd = "z";

      ls = "eza";
    };
    bashrcExtra = ''
    '';
  };
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  home.sessionVariables.EDITOR = "nvim";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
