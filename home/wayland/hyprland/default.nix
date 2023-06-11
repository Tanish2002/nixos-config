{
  pkgs,
  theme,
  config,
  ...
}: {
  home.packages = [pkgs.hyprland];
  xdg.configFile."hyprland.conf" = {
    text = import ./config.nix {inherit pkgs theme config;};
    target = "hypr/hyprland.conf";
    onChange = "${pkgs.hyprland}/bin/hyprctl reload";
  };
}
