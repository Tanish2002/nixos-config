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
      prePatch = ''
        substituteInPlace src/Apps/Alias.hs \
        --replace '~/.fehbg' '${pkgs.feh}/bin/feh --bg-fill ${config.home.homeDirectory}/Wallpapers/${theme.config.wallpaper}'

        substituteInPlace src/Container/Layout.hs \
        --replace '#0F0F12' '#${theme.config.bg}' \
        --replace '#F2A5B7' '#${
          if theme.config.name == "flower"
          then theme.config.pink
          else theme.config.c13
        }' \
        --replace '#090909' '#${theme.config.lbg}' \
        --replace '#000000' '#${theme.config.dbg}' \
        --replace 'VictorMono Nerd Font Mono' '${theme.config.font1}'


        substituteInPlace src/Config/Options.hs \
        --replace '#f55966' '#${theme.config.c9}' \
        --replace '#090909' '#${theme.config.dbg}' \
        --replace 'VictorMono Nerd Font Mono' '${theme.config.font1}'


        substituteInPlace src/Hooks/LogHook.hs \
        --replace '#f55966' '#${theme.config.c9}' \
        --replace '#b789cd' '#${
          if theme.config.name == "flower"
          then theme.config.c13
          else theme.config.purple
        }'

        substituteInPlace src/xmonad.hs \
        --replace '#0f0f12' '#${theme.config.bg}'
      '';
    });
in {
  home.packages = [xmonad-tanish2002];
  xsession.windowManager.command = "${xmonad-tanish2002}/bin/xmonad";
}
