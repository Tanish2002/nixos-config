{ pkgs, config, ... }: {
  imports = [
    # ./virtualization
    ./vpn.nix
  ];
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
  environment.systemPackages = with pkgs; [
    wpa_supplicant_gui
    connman-gtk
    docker-compose
  ];
  boot.initrd.kernelModules = [ "amdgpu" "acpi_call" ];
  boot.blacklistedKernelModules =
    [ "nouveau" "nvidia_drm" "nvidia_modeset" "nvidia" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  virtualisation.docker.enable = true;
  users.users.weeb.extraGroups = [ "docker" ];
}
