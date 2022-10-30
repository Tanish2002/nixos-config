{ pkgs, config, ... }: {
  imports = [ ./virtualization ./vpn.nix ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod;
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
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
  environment.systemPackages = with pkgs; [ wpa_supplicant_gui connman-gtk ];
  boot.initrd.kernelModules = [ "amdgpu" "acpi_call" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
