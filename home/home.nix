{ config, lib, pkgs, inputs, ... }: {
  imports = [ ./term ./programs ./wallpapers ./X ./scripts ./dev ./theming ];
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "weeb";
    homeDirectory = "/home/weeb";
    # General Packages
    packages = with pkgs; [
      gnome.file-roller
      kochi-substitute
      qbittorrent
      libreoffice-fresh
      inputs.comma.defaultPackage.x86_64-linux
    ];
    sessionVariables = { MOZ_DBUS_REMOTE = 1; };
  };
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
