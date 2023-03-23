{ pkgs, theme, config, ... }: {
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = "Iosevka Term 14";
      terminal = "${pkgs.st-tanish2002}/bin/st";
      extraConfig = {
        modi = "run,ssh,drun";
        columns = 1;
        disable-history = false;
        hide-scrollbar = true;
      };
      theme = import ./colors.nix { inherit config theme; };
    };
  };
}
