{ pkgs, ... }:
{
# Flatpak
  services.flatpak.enable = true;
    
# Appimages
  programs.appimage.binfmt = true;
  environment.systemPackages = with pkgs; [
   appimage-run
  ];
}
