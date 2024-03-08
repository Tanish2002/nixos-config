{
  pkgs,
  config,
  theme,
  ...
}: {
  services.polybar = rec {
    enable = true;
    package = pkgs.polybar.override {pulseSupport = true;};
    settings = import ./config.nix {inherit pkgs config theme;};
    script = "DEFAULT_NETWORK_INTERFACE=$(${pkgs.iproute2}/bin/ip route | ${pkgs.gnugrep}/bin/grep '^default' | ${pkgs.coreutils}/bin/cut -f 5 -d ' ' | ${pkgs.coreutils}/bin/head -n1) ${package}/bin/polybar main &";
  };
}
