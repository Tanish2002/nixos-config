{
  description = "Epic Nixos Config";
  nixConfig = {
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "emacsng.cachix.org-1:i7wOr4YpdRpWWtShI8bT6V7lOTnPeI7Ho6HaZegFWMI="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://emacsng.cachix.org"
      "https://nix-community.cachix.org"
      "https://fortuneteller2k.cachix.org"
    ];
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixpkgs-2105.url = "github:nixos/nixpkgs/nixos-21.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "unstable";
    };
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    emacs-ng.url = "github:emacs-ng/emacs-ng?ref=v0.0.6b6dfb3";
    discord-overlay = {
      url = "github:InternetUnexplorer/discord-overlay";
      inputs.nixpkgs.follows = "unstable";
    };
    comma = {
      url = "github:nix-community/comma";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    discocss = {
      url = "github:mlvzk/discocss/flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    picom-phisch = {
      url = "github:Tanish2002/picom";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "github:Tanish2002/wallpapers";
      flake = false;
    };
    bin = {
      url = "github:Tanish2002/bin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    phocus = {
      url = "github:Tanish2002/gtk";
      flake = false;
    };
    dwm-tanish2002 = {
      url = "github:Tanish2002/dwm-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    st-tanish2002 = {
      url = "github:Tanish2002/st-tanish2002";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xmonad-tanish2002 = {
      url = "github:Tanish2002/xmonad-tanish2002";
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
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };
  outputs = inputs@{ self, nixpkgs, unstable, utils, home-manager, discocss, nur
    , nix-doom-emacs, nixvim, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig.allowUnfree = true;
      sharedOverlays = [ (import ./overlays) ];

      hostDefaults.modules = [
        home-manager.nixosModules.home-manager
        ./system/sharedConfig.nix
        {
          home-manager = {
            users.weeb = import ./home/home.nix;
            sharedModules = [
              discocss.hmModule
              nixvim.homeManagerModules.nixvim
              nix-doom-emacs.hmModule
              {
                nixpkgs.overlays = [
                  nur.overlay
                  (final: _:
                    let system = final.system;
                    in {
                      unstable = import unstable {
                        system = "${system}";
                        config.allowUnfree = true;
                      };
                    })
                ];
              }
            ];
            extraSpecialArgs = {
              inherit inputs;
              theme = import ./theme;
            };
          };
        }
      ];
      hosts.anime.modules = [ ./system/hosts/anime ];
    };
}
