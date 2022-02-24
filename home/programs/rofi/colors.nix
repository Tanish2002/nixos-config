{ theme, config }:
with theme.colors;
let inherit (config.lib.formats.rasi) mkLiteral;
in {
  "*" = {
    black = mkLiteral "#${c0}";
    red = mkLiteral "#${c9}";
    green = mkLiteral "#${c2}";
    yellow = mkLiteral "#${c3}";
    blue = mkLiteral "#${c4}";
    purple = mkLiteral "#${c5}";
    cyan = mkLiteral "#${c6}";
    emphasis = mkLiteral "#${c1}";
    text = mkLiteral "#${c15}";
    text-alt = mkLiteral "#${c7}";
    fg = mkLiteral "#${fg}";
    sel = mkLiteral "#${cc}32";
    bg-alt = mkLiteral "#${bg}";
    bg = mkLiteral "#${bg}";

    spacing = 0;
    background-color = mkLiteral "transparent";

    font = "Iosevka Term 14";

    text-color = mkLiteral "@text";
    border-color = mkLiteral "@red";

  };

  "window" = {
    transparency = "real";
    fullscreen = true;
    background-color = mkLiteral "@bg";
    width = mkLiteral "400px";
    border-color = mkLiteral "@red";
    border = mkLiteral "0px";
    padding = mkLiteral "30%";
  };

  "#mainbox" = {
    border = 0;
    padding = 20;
    width = mkLiteral "250px";
  };

  "#message" = {
    border = mkLiteral "0px solid 0px 0px";
    padding = mkLiteral "0px 0px 0px";
  };

  "#textbox" = {
    text-color = mkLiteral "@fg";
    spacing = 4;
    padding = 8;
  };

  "inputbar" = {
    margin = mkLiteral "0px 0px 0px 0px";
    children = map mkLiteral [
      "prompt"
      "textbox-prompt-colon"
      "entry"
      "case-indicator"
    ];
    spacing = 5;
    padding = 8;
  };

  "prompt" = { text-color = mkLiteral "@red"; };

  "textbox-prompt-colon" = {
    expand = false;
    str = ":";
    text-color = mkLiteral "@text-alt";
  };

  "entry" = { margin = mkLiteral "0px 0px"; };

  "#listview" = {
    lines = 4;
    spacing = 4;
  };

  "#listview" = {
    fixed-height = 0;
    border = mkLiteral "0px solid 0px 0px";
    padding = mkLiteral "2px 0px 0px";
  };

  "#element" = {
    spacing = 2;
    padding = 8;
    #border-radius: 0.3em;
    border = mkLiteral "0px 0px 0px 6px";
    text-color = mkLiteral "@fg";
  };

  "element.normal" = {
    background-color = mkLiteral "transparent";
    border-color = mkLiteral "@bg-alt";
  };
  "element.selected" = {
    background-color = mkLiteral "@sel";
    border-color = mkLiteral "@red";
  };

  "#scrollbar" = {
    border = 0;
    width = mkLiteral "4px";
    padding = 0;
    handle-color = mkLiteral "@normal-foreground";
  };

  "#sidebar" = {
    border = mkLiteral "0px solid 0px 0px";
    border-color = mkLiteral "#131317";
  };

  "#button selected" = {
    background-color = mkLiteral "@selected-normal-background";
    text-color = mkLiteral "#ffffff";
  };

  "#window.mainbox.inputbar" = { spacing = 0; };

  "#window.mainbox.inputbar.normal" = {
    foreground = mkLiteral "@normal-foreground";
    background = mkLiteral "@selected-normal-background";
  };

  "#prompt" = {
    spacing = 0;
    border = 0;
    border-radius = 0;
    text-color = mkLiteral "@red";
  };
}
