{ config, lib, pkgs, inputs, ... }: {
  imports = [ ./term ./programs ./wallpapers ./X ./scripts ./dev ./theming ];
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "weeb";
    homeDirectory = "/home/weeb";
    packages = with pkgs; [ gnome.file-roller kochi-substitute ];
    sessionVariables = { MOZ_DBUS_REMOTE = 1; };
  };
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}
