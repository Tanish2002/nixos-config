{ inputs, pkgs, ... }: {
  #Overlay for custom build of dwm, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      dwm-tanish2002 = inputs.dwm-tanish2002.defaultPackage.x86_64-linux;
    })
  ];
  home.packages = [ pkgs.dwm-tanish2002 ];
}
