{ config, pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    #    initrd.kernelModules = [ "amdgpu" ];
  };

  networking = {
    hostName = "anime";
    networkmanager.enable = true;
    useDHCP = false;
    # interfaces = {
    #   en01.useDHCP = true;
    #   wlp4s0.useDHCP = true;
    # };
  };

  # Time Zone
  time.timeZone = "Asia/Kolkata";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # X11 Stuff 
  services = {
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];

      # Touchpad
      libinput = {
        enable = true;
        touchpad.tapping = false;
      };

      # Gnome Stuff
      windowManager.xmonad.enable = true;
      displayManager.sx.enable = true;
    };
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User account 
  users.users.weeb = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;

  # System Packages
  environment.systemPackages = with pkgs; [
    wget
    neovim
    #git
    nixfmt
    nixpkgs-fmt
    light
    nvidia-offload
    cpufrequtils
  ];
  programs = {
    zsh = {
      enable = true;
      enableCompletion = false;
    };
    ssh.startAgent = false;
    # gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    #   pinentryFlavor = "curses";
    # };
  };
  services.openssh.enable = true;
  programs.dconf.enable = true;
  # Make nix use nixUnstable and enable flakes
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
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

  system.stateVersion = "21.11";

}

