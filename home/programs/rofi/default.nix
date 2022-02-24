{ pkgs, theme, config, ... }: {
  programs = {
    rofi = {
      enable = true;
      package = pkgs.unstable.rofi;
      font = "FuraCode Nerd Font Mono Bold 18";
      terminal = "${pkgs.st-tanish2002}/bin/st";
      extraConfig = {
        modi = "run,ssh,drun";
        columns = 2;
        disable-history = false;
        hide-scrollbar = true;
      };
      theme = import ./colors.nix { inherit config theme;};
    };
  };
}
