{
  inputs,
  pkgs,
  ...
}: {
  #Overlay for custom build of St, Installed in home.nix
  nixpkgs.overlays = [
    (_: _: {
      st-tanish2002 = inputs.st-tanish2002.defaultPackage.x86_64-linux;
    })
  ];
  home.packages = [pkgs.st-tanish2002];
}
