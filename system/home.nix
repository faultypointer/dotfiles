{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    
    ./apps/neovim
    ./apps/firefox
	./apps/zellij
  ];
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-light-soft;

  home.username = "faulty";
  home.homeDirectory = "/home/faulty";
  

  home.packages = with pkgs; [
    neofetch
	blackbox-terminal

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
    beeper
    
    gnumake
    cmake
    gitui

    foliate
    obsidian
    logseq


    nodePackages.webtorrent-cli
	magic-wormhole-rs
	wiki-tui
	mpv
	webcord
	adw-gtk3
	gnome.gnome-tweaks
	amberol
	gnome-extension-manager
	gnomeExtensions.pano

	# potential hobby
	krita
	blender
	

	gnomeExtensions.battery-health-charging
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
      line_break.disabled = false;
    };
  }; 

  # programs.zellij = {
  #   enable = true;
  #   settings = {};
  # };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      z = "zoxide";
      cd = "z";

      ls = "eza --icons";
	  tess = "$HOME/dotfiles/shell/tess";
	  dev = "$HOME/dotfiles/shell/developer";
    };
    bashrcExtra = ''
    '';
  };
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables.EDITOR = "nvim";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
