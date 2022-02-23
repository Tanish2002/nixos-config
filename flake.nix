{
  description = "Epic Nixos Config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    discord-overlay = {
      url = "github:InternetUnexplorer/discord-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    discocss = {
      url = "github:mlvzk/discocss/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    picom-git = {
      url = "github:Tanish2002/picom?submodules=1";
      flake = false;
    };
    wallpapers = {
      url = "github:Tanish2002/wallpapers";
      flake = false;
    };
    phocus = {
      url = "github:Tanish2002/gtk";
      flake = false;
    };
    dwm-git = {
      url = "github:Tanish2002/dwm-tanish2002";
      flake = false;
    };
    st-git = {
      url = "github:Tanish2002/st-tanish2002";
      flake = false;
    };
    xmonad-git = {
      url = "github:Tanish2002/xmonad-tanish2002";
      flake = false;
    };
    tabbed-git = {
      url = "github:Tanish2002/tabbed-tanish2002";
      flake = false;
    };
    nix-zsh-completions = {
      url = "github:spwhitt/nix-zsh-completions";
      flake = false;
    };
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs =
    inputs@{ self, nixpkgs, unstable, utils, home-manager, discocss, nur, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig.allowUnfree = true;

      hosts.anime.modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.weeb = import ./home/home.nix;
            sharedModules = [
              discocss.hmModule
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

    };
}
