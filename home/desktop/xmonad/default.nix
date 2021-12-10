{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: rec {
      haskellPackages = prev.haskellPackages.override (
        old: {
          overrides = prev.lib.composeExtensions (old.overrides or (_: _: { }))
            (
              self: super: rec {
                xmonad-tanish2002 = self.callCabal2nix "xmonad-tanish2002" ./config
                  { };
              }
            );
        }
      );
    })
  ];
}
