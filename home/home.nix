{ config, lib, pkgs, inputs, ... }: {
  imports = [ ./term ./programs ./wallpapers ./X ./scripts ./dev ./theming ];
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "weeb";
    homeDirectory = "/home/weeb";
    packages = with pkgs; [
      gnome.file-roller
    ];
  };
  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
}