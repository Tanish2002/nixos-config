{ inputs, pkgs, theme, ... }: {
  nixpkgs.overlays = [
    (final: prev: rec {
      xmonad-tanish2002 =
        inputs.xmonad-tanish2002.defaultPackage.x86_64-linux.overrideAttrs (o: {
          patches = [ ./change-alias.diff ];
          postPatch = ''
            substituteInPlace src/Apps/Alias.hs \
            --replace '~/.fehbg' '${pkgs.feh}/bin/feh --bg-fill $HOME/Wallpapers/${theme.config.wallpaper}' \
          '';
        });
    })
  ];
  home.packages = [ pkgs.xmonad-tanish2002 ];
  xsession = {
    enable = true;
    windowManager.command =
      "${pkgs.xmonad-tanish2002}/bin/xmonad";
  };
}