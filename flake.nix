{
  description = "Epic Nixos Config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    picom-git = { url = "github:Tanish2002/picom/master"; flake = false; };
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
  };

  outputs = inputs@{ self, nixpkgs, utils, home-manager, ... }:
    utils.lib.mkFlake {
      inherit self inputs;
      channelsConfig.allowUnfree = true;

#      sharedOverlays = [
#        self.overlay
#      ];

     # hostDefaults.modules = [
     #   home-manager.nixosModules.home-manager {
     #     home-manager.users.weeb = import ./home/home.nix;
     #     home-manager.extraSpecialArgs = { inherit inputs; };
     #   }
     # ];
      hosts.anime.modules = [ 
        ./system/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.users.weeb = import ./home/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];

#      overlay = import ./overlays { inherit picom-git; }; 
    };
}
