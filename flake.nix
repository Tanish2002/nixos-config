{
  description = "Epic Nixos Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixpkgs-2105.url = "github:nixos/nixpkgs/nixos-21.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      # url = "github:nix-community/home-manager";

      # use my fork till my lf PR gets merged
      url = "github:Tanish2002/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    discord-overlay = {
      url = "github:InternetUnexplorer/discord-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
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
    , nixvim, ... }:
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
              {
                nixpkgs.overlays = [
                  nur.overlay
                  (final: prev: {
                    unstable = unstable.legacyPackages.${prev.system};
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
