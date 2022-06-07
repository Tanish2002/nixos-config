{ config, lib, pkgs, ... }: {
  imports = [ ./term ./programs ./wallpapers ./X ./scripts ./dev ./theming ];
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "weeb";
    homeDirectory = "/home/weeb";
    # General Packages
    packages = with pkgs; [
      gnome.file-roller
      qbittorrent
      ipafont
      libreoffice-fresh
      zathura
      comma
    ];
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      XDG_CURRENT_DESKTOP = "sway";
      MOZ_DBUS_REMOTE = 1;
    };
  };
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
