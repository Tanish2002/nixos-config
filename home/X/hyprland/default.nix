{ pkgs, theme, config, ... }: {
  home.packages = [ pkgs.f2k.hyprland ];
  xdg.configFile."hyprland.conf" = {
    text = import ./config.nix { inherit pkgs theme config; };
    target = "hypr/hyprland.conf";
  };
}
