{ pkgs, theme, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override { pulseSupport = true; };
    settings = import ./config.nix { inherit theme; };
    script = ""; # Open using Window manager so custom scripts can work
  };
}
