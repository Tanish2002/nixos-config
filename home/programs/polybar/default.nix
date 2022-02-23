{ pkgs, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override { pulseSupport = true; };
    config = ./config.ini;
    script = ""; # Open using Window manager so custom scripts can work
  };
}
