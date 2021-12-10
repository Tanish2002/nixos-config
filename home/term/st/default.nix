{ ... }:
{
#Overlay for custom build of St, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      st-tanish2002 = prev.st.overrideAttrs
        (o: {
          src = prev.fetchFromGitHub {
            owner = "Tanish2002";
            repo = "st-tanish2002";
            rev = "15d62189db322c5cbc223a77a45954742a10428a";
            sha256 = "mj2qVHDYgqaB9ghztgmKUVHmo9ffxo/H3rgXWLpA1B8=";
          };
          buildInputs = o.buildInputs ++ [ prev.harfbuzz ];
        });
    })
  ];
}
