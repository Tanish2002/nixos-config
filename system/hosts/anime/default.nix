{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./virtualization
    ./vpn.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [
      rtl8821au
    ];
    initrd.kernelModules = ["8821au"];
    extraModprobeConfig = ''
      options 8821au rtw_led_ctrl=0
    '';
    blacklistedKernelModules = ["rtw88_8822ce"]; # Disable built-in network card
  };

  networking = {
    hostName = "anime";
    useDHCP = false;
  };

  services.connman = {
    enable = true;
    package = pkgs.connmanFull;
    wifi.backend = "iwd";
  };

  # Ports for Expo-CLI
  networking.firewall.allowedTCPPorts = [8081];

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
