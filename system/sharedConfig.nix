{pkgs, ...}: {
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

  # Time Zone
  time.timeZone = "Asia/Kolkata";

  # ENV VARIABLES
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    #   XDG_CURRENT_DESKTOP = "sway";
    MOZ_DBUS_REMOTE = "1";
  };

  # Internationalisation stuff.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Wayland Stuff
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs;
  #     [
  #       xdg-desktop-portal-wlr
  #       #xdg-desktop-portal-gtk
  #     ];
  #   gtkUsePortal = true;
  # };
  security.polkit.enable = true;
  hardware.opengl.enable = true;
  fonts.enableDefaultFonts = true;
  programs = {xwayland.enable = true;};
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
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
  # sound.enable = false;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  nixpkgs.config.pulseaudio = true;
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

  # System Packages
  environment.systemPackages = with pkgs; [
    wget
    git
    git-crypt
    alejandra
    cachix
    alsa-utils
    micro
    htop
    pavucontrol
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
    package = pkgs.unstable.nix;
    settings.trusted-users = ["root" "weeb"];
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "21.11";
}
