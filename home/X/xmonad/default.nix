{ inputs, pkgs, theme, ... }:
let
  drv = pkgs.haskellPackages.callCabal2nix "xmonad-tanish2002" inputs.xmonad-git
    { };
in {
  nixpkgs.overlays = [
    (final: prev: rec {
      haskellPackages = prev.haskellPackages.override (old: {
        overrides = prev.lib.composeExtensions (old.overrides or (_: _: { }))
          (self: super: rec {
            xmonad-tanish2002 = drv.overrideAttrs (o: {
              postPatch = ''
                substituteInPlace src/Apps/Alias.hs \
                --replace '~/.fehbg' '${pkgs.feh}/bin/feh --bg-fill $HOME/Wallpapers/${theme.config.wallpaper}' \
              '';
              patches = [ ./change-alias.diff ];

            });
          });
      });
    })
  ];
  home.packages = [ pkgs.haskellPackages.xmonad-tanish2002 ];
  xsession = {
    enable = true;
    windowManager.command =
      "${pkgs.haskellPackages.xmonad-tanish2002}/bin/xmonad";
  };
}