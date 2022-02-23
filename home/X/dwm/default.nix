{ inputs, pkgs, ... }: {
  #Overlay for custom build of dwm, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      dwm-tanish2002 = prev.dwm.overrideAttrs (o: { src = inputs.dwm-git; });
    })
  ];
  home.packages = [ pkgs.dwm-tanish2002 ];
}
