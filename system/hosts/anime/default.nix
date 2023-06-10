{pkgs, ...}: {
  imports = [
    # ./virtualization
    ./vpn.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  networking = {
    hostName = "anime";
    useDHCP = false;
  };
  services.connman = {
    enable = true;
    package = pkgs.connmanFull;
    wifi.backend = "iwd";
  };
  hardware.bluetooth.enable = true;
  environment.systemPackages = with pkgs; [
    wpa_supplicant_gui
    connman-gtk
    docker-compose
  ];

  # Printing
  services.printing = {
    enable = true;
    drivers = [pkgs.hplipWithPlugin];
  };

  virtualisation.docker.enable = true;
  users.users.weeb.extraGroups = ["docker"];
}
