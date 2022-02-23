{ inputs, pkgs, ... }: {
  #Overlay for custom build of St, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      st-tanish2002 = prev.st.overrideAttrs (o: {
        src = inputs.st-git;
        buildInputs = o.buildInputs ++ [ prev.harfbuzz ];
      });
    })
  ];
  home.packages = [ pkgs.st-tanish2002 ];
}
