{ pkgs, ... }: {
  imports = [ ./virtualization ];
  networking = {
    hostName = "anime";
    networkmanager.enable = true;
    # wireless = {
    #   enable = true;
    #   userControlled.enable = true;
    #   interfaces = [ "wlp4s0" ];
    #   # extraConfig = ''
    #   # freq_list=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 2467 2472
    #   # scan_freq=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 2467 2472
    #   # '';
    #   networks = {
    #     "Tukki" = {
    #       psk = "";
    #     };
    #   };
    # };
    useDHCP = false;
  };
  environment.systemPackages = with pkgs; [ wpa_supplicant_gui ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
