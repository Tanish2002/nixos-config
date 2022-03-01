{ pkgs, theme, ... }: {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override { pulseSupport = true; };
    settings = import ./config.nix { inherit theme pkgs; };
    script =
      "DEFAULT_NETWORK_INTERFACE=$(ip route | ${pkgs.gnugrep}/bin/grep '^default' | awk '{print $5}' | head -n1) polybar main &";
  };
}
