{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    
    ./apps/neovim
    ./apps/firefox
	./apps/zellij
	./apps/newsboat
	# ./apps/kitty
	./apps/alacritty
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
	lazygit
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
	octaveFull

    foliate
	gnome.gnome-mines
    obsidian
    logseq

	typst
	zathura
	appimage-run
	anki


	magic-wormhole-rs
	wiki-tui
	mpv
	webcord
	gnome.gnome-tweaks
	amberol
	gnome-extension-manager
	gnomeExtensions.pano

	# potential hobby
	krita
	blender	
	gimp
	godot_4
  ];
  
  gtk = {
    enable = true;
	theme = {
	  name = "adw-gtk3";
	  package = pkgs.adw-gtk3;
	};
    iconTheme = {
	  package = pkgs.gnome.adwaita-icon-theme;
	  name = "adwaita-icon-theme";
	};
  };



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
	  format = "$nix_shell$git_branch$git_commit$git_state$git_status$directory$cmd_duration\n$character";
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
    initExtra = ''
		export DIRENV_LOG_FORMAT=
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
