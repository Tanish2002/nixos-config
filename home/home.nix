{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./term
    ./programs
    ./wallpapers
    ./X
    # ./wayland
    ./scripts
    ./dev
    ./theming
  ];
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
      flashfocus
    ];
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      # XDG_CURRENT_DESKTOP = "sway";
      MOZ_DBUS_REMOTE = 1;
    };
  };
  xsession.enable = true;
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
