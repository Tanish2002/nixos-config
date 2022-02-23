{ inputs, pkgs, ... }: {
  #Overlay for custom build of tabbed, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      tabbed-tanish2002 =
        prev.tabbed.overrideAttrs (o: { src = inputs.tabbed-git; });
    })
  ];
  home.packages = [pkgs.tabbed-tanish2002 ];
}
