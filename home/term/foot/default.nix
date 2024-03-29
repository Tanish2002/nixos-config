{theme, ...}: {
  programs.foot = with theme.config; {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "${font1}:pixelsize=${font1_size}";
        dpi-aware = "yes";
        pad = "${pad}x${pad}";
      };
      cursor.style = "beam";
      key-bindings = {
        clipboard-copy = "Mod1+c XF86Copy";
        clipboard-paste = "Mod1+v XF86Paste";
      };
      colors = {
        alpha = 1.0;
        foreground = "${fg}";
        background = "${bg}";
        regular0 = "${c0}";
        regular1 = "${c1}";
        regular2 = "${c2}";
        regular3 = "${c3}";
        regular4 = "${c4}";
        regular5 = "${c5}";
        regular6 = "${c6}";
        regular7 = "${c7}";

        bright0 = "${c8}";
        bright1 = "${c9}";
        bright2 = "${c10}";
        bright3 = "${c11}";
        bright4 = "${c12}";
        bright5 = "${c13}";
        bright6 = "${c14}";
        bright7 = "${c15}";
      };
    };
  };
}
