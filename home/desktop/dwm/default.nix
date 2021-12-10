{ ... }:
{
#Overlay for custom build of dwm, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      dwm-tanish2002 = prev.dwm.overrideAttrs
        (o: {
          src = prev.fetchFromGitHub {
            owner = "Tanish2002";
            repo = "dwm-tanish2002";
            rev = "640caa5049073cde0bbe80ad7dade6acb86e20e0";
            sha256 = "Tasd+0Cd7aBx7+VRQpbn+cGKVi8Eh6qtxn2I1g7fZks=";
          };
        });
    })
  ];
}
