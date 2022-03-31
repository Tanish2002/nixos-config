{ config, pkgs, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      themePackages = [ pkgs.plymouth-themes ];
      theme = "blockchain";
    };
  };

  # Time Zone
  time.timeZone = "Asia/Kolkata";

  # Internationalisation stuff.
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

      # Touchpad
      libinput = {
        enable = true;
        touchpad.tapping = true;
      };

      # Display Manager
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
    #neovim
    git
    nixfmt
    nixpkgs-fmt
    git-crypt
    cachix
  ];
  programs = {
    zsh = {
      enable = true;
      enableCompletion =
        false; # I'm enabling it in Home-manager config so I disable it here so compinit isn't called twice.
    };
    dconf.enable = true;
    light.enable = true;
  };
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # Make nix use nixUnstable and enable flakes
  nix = {
    package = pkgs.nixUnstable;
    trustedUsers = [ "root" "weeb" ];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "21.11";

}

