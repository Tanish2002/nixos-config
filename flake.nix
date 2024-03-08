{
  description = "Epic Nixos Config";
  nixConfig = {
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://fortuneteller2k.cachix.org"
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs_23.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "unstable";
    };
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mpv-discord-rpc = {
      url = "github:cniw/mpv-discordRPC";
      flake = false;
    };
    wallpapers = {
      url = "github:Tanish2002/wallpapers";
      flake = false;
    };
    bin = {
      url = "git+file:/home/weeb/bin1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-config = {
      # url = "github:Tanish2002/neovim-config";
      url = "git+file:/home/weeb/neovim-config";
      # inputs.nixpkgs.follows = "unstable";
    };
    phocus = {
      url = "github:phocus/gtk";
      flake = false;
    };
    dwm-tanish2002 = {
      url = "github:Tanish2002/dwm-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    st-tanish2002 = {
      # url = "github:Tanish2002/st-tanish2002";
      url = "git+file:/home/weeb/st-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xmonad-tanish2002 = {
      # url = "github:Tanish2002/xmonad-tanish2002";
      url = "git+file:/home/weeb/xmonad-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tabbed-tanish2002 = {
      url = "github:Tanish2002/tabbed-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-zsh-completions = {
      url = "github:spwhitt/nix-zsh-completions";
      flake = false;
    };
    zjstatus.url = "github:dj95/zjstatus";
    tmux-catppuccin = {
      url = "github:catppuccin/tmux";
      flake = false;
    };
    tmux-sessionx.url = "github:omerxx/tmux-sessionx/0345b61be9c315dcb16ae1506865fc102acd8eb9";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs_23,
    unstable,
    utils,
    home-manager,
    nur,
    nixpkgs-f2k,
    nixos-hardware,
    ...
  }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig = {
        allowUnfree = true;
        pulseaudio = true;
        joypixels.acceptLicense = true;
      };
      channels.nixpkgs.input = nixpkgs;

      sharedOverlays = [
        (import ./overlays {inherit inputs;})
        nur.overlay
        nixpkgs-f2k.overlays.compositors

        # Unstable Packages for System Nixpkgs (pkgs.unstable.foo)
        (final: _: let
          inherit (final) system;
        in {
          unstable = import unstable {
            system = "${system}";
            config.allowUnfree = true;
          };
          old = import nixpkgs_23 {
            system = "${system}";
            config.allowUnfree = true;
          };
        })
      ];

      hostDefaults.modules = [
        nixos-hardware.nixosModules.lenovo-ideapad-15arh05
        home-manager.nixosModules.home-manager
        ./system/sharedConfig.nix
        ./home/home.nix
      ];
      hostDefaults.specialArgs = {inherit inputs;};
      hosts.anime.modules = [./system/hosts/anime];
    };
}
