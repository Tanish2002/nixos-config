{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      themePackages = [(pkgs.adi1090x-plymouth-themes.override {selected_themes = ["blockchain"];})];
      theme = "blockchain";
    };
  };
  services = {
    gvfs.enable = true;
    udisks2.enable = true;

    # X11 Stuff

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

      # Remap ctrl to caps lock
      xkbOptions = "ctrl:swapcaps";
    };

    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
  };
  # Time Zone
  time.timeZone = "Asia/Kolkata";
  environment = {
    # ENV VARIABLES
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      #   XDG_CURRENT_DESKTOP = "sway";
      MOZ_DBUS_REMOTE = "1";
    };
    etc."xdg/user-dirs.defaults".text = ''
      DESKTOP=Desktop
      DOCUMENTS=Documents
      DOWNLOAD=Downloads
      MUSIC=Music
      PICTURES=Pictures
      PUBLICSHARE=Public
      TEMPLATES=Templates
      VIDEOS=Videos
    '';

    # System Packages
    systemPackages = with pkgs; [
      wget
      git
      git-crypt
      alejandra
      cachix
      alsa-utils
      micro
      htop
      pavucontrol
      protonvpn-gui
      protonvpn-cli
    ];
  };
  # Internationalisation stuff.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Wayland Stuff
  # xdg.portal = {
  #   enable = true;
  # extraPortals = with pkgs;
  #   [
  #     xdg-desktop-portal-wlr
  #     #xdg-desktop-portal-gtk
  #   ];
  # gtkUsePortal = true;
  # };
  security.polkit.enable = true;
  hardware.opengl.enable = true;
  fonts.enableDefaultPackages = true;
  programs = {xwayland.enable = true;};
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    configPackages = [pkgs.gnome.gnome-session];
  };

  # Enable sound.
  # sound.enable = false;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  # pkgs.config.pulseaudio = true;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  #   wireplumber.enable = true;
  #   # jack.enable = true;
  # };
  # environment.etc = {
  #   "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
  #     bluez_monitor.properties = {
  #       ["bluez5.enable-sbc-xq"] = true,
  #       ["bluez5.enable-msbc"] = true,
  #       ["bluez5.enable-hw-volume"] = true,
  #       ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
  #     }
  #   '';
  # };

  # User account
  users.users.weeb = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
    shell = pkgs.zsh;
  };
  security.sudo.wheelNeedsPassword = false;
  programs = {
    zsh = {
      enable = true;
      enableCompletion =
        false; # I'm enabling it in Home-manager config so I disable it here so compinit isn't called twice.
    };
    dconf.enable = true;
    light.enable = true;
  };

  # Make nix use nixUnstable and enable flakes
  nix = {
    package = pkgs.unstable.nix;
    settings = {
      trusted-users = ["root" "weeb"];
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
  };
  # pkgs.config.allowUnfree = true;
  # This will add your inputs as registries, making operations with them (such
  # as nix shell nixpkgs#name) consistent with your flake inputs.
  nix.registry = lib.mapAttrs' (n: v: lib.nameValuePair n {flake = v;}) inputs;

  system.stateVersion = "21.11";
}
