{ pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in {
  networking = {
    hostName = "anime";
    networkmanager.enable = true;
    # wireless = {
    #   enable = true;
    #   userControlled.enable = true;
    #   networks = {
    #     "Tukki_5G" = {
    #       psk = "";
    #     };
    #     "Tukki" = {
    #       psk = "";
    #     };
    #   };
    # };
    useDHCP = false;
  };
  environment.systemPackages = with pkgs; [ nvidia-offload wpa_supplicant_gui ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.nvidia = {
    prime = {
      offload.enable = true;
      # Bus ID of the Amd GPU. You can find it using lspci, either under 3D or VGA
      amdgpuBusId = "PCI:5:0:0";
      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";
    };
    powerManagement.enable = true;
  };
}
