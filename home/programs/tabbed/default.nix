{ inputs, pkgs, ... }: {
  #Overlay for custom build of tabbed, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      tabbed-tanish2002 = inputs.tabbed-tanish2002.defaultPackage.x86_64-linux;
    })
  ];
  home.packages = [ pkgs.tabbed-tanish2002 ];
}
