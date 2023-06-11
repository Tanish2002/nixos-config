{
  pkgs,
  theme,
  config,
  ...
}: let
  xmonad-tanish2002 =
    pkgs.xmonad-tanish2002.overrideAttrs
    (_: {
      patches = [./change-alias.diff];
      postPatch = ''
        substituteInPlace src/Apps/Alias.hs \
        --replace '~/.fehbg' '${pkgs.feh}/bin/feh --bg-fill ${config.home.homeDirectory}/Wallpapers/${theme.config.wallpaper}'

        substituteInPlace src/Config/Options.hs \
        --replace ', autoload = setWMName "XMonad"' ', autoload = setWMName "LG3D"'
      '';
    });
in {
  home.packages = [xmonad-tanish2002];
  xsession.windowManager.command = "${xmonad-tanish2002}/bin/xmonad";
}
