{ pkgs, theme, config, inputs, ... }:
let hyprland = inputs.hyprland.defaultPackage.x86_64-linux;
in {
  home.packages = [ hyprland ];
  xdg.configFile."hyprland.conf" = {
    text = import ./config.nix { inherit pkgs theme config; };
    target = "hypr/hyprland.conf";
    onChange = "${hyprland}/bin/hyprctl reload";
  };
}
