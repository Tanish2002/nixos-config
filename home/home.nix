{ config, lib, pkgs, ... }:
{
  #imports = [ ./term ./desktop  ];
  imports = [ ./desktop  ];
  home = {
    username = "weeb";
    homeDirectory = "/home/weeb";
    packages = with pkgs; [
      ripgrep
      fzf
      nixpkgs-fmt
      #haskellPackages.xmonad-tanish2002
      #st-tanish2002
      #dwm-tanish2002
      #tabbed-tanish2002
#      nerdfonts
#      chromium
    ];
  };
  programs = {
    bat = {
      enable = true;
      config = {
        theme = "GitHub";
        italic-text = "always";
        color = "always";
      };
    };
  };

  home.stateVersion = "21.11";
  programs.home-manager.enable = true;
  #fonts.fontconfig.enable = true;
}
