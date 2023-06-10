{pkgs, ...}: {
  services.tailscale = {enable = true;};
  networking.firewall.allowedUDPPorts = [41641];
  networking.firewall.checkReversePath = "loose";
  environment.systemPackages = [pkgs.tailscale];
}
