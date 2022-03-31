{ pkgs, theme, inputs, ... }:
with theme.config; {
  programs.helix = {
    enable = true;
    package = pkgs.unstable.helix;
    languages = [
      {
        name = "go";
        scope = "source.go";
        injection-regex = "go";
        file-types = [ "go" ];
        roots = [ "Gopkg.toml" "go.mod" ];
        auto-format = true;
        comment-token = "//";
        language-server = { command = "gopls"; };
        indent = {
          tab-width = 4;
          unit = "	";
        };
      }
      {
        name = "rust";
        scope = "source.rust";
        injection-regex = "rust";
        file-types = [ "rs" ];
        roots = [ "Cargo.toml" "Cargo.lock" ];
        auto-format = true;
        comment-token = "//";
        language-server = { command = "rust-analyzer"; };
        indent = {
          tab-width = 4;
          unit = "    ";
        };
      }
    ];
    settings = {
      theme = "base16_default";
      lsp.display-messages = true;
      editor.true-color = true;
      keys.normal = {
        space = {
          space = "file_picker";
          w = ":w";
          q = ":q";
        };
      };
      #space.w = ":w";
      #space-q = ":q";
    };
    themes = {
      custom = let
        transparent = "none";
        gray = "#${c7}";
        dark-gray = "#${c8}";
        white = "#${c15}";
        black = "#${c0}";
        red = "#${c1}";
        green = "#${c2}";
        yellow = "#${c3}";
        orange = "#${c11}";
        blue = "#${c4}";
        magenta = "#${c5}";
        cyan = "#${c6}";
      in {
        "ui.menu" = transparent;
        "ui.menu.selected" = { modifiers = [ "reversed" ]; };
        "ui.linenr" = {
          fg = gray;
          bg = dark-gray;
        };
        "ui.popup" = { modifiers = [ "reversed" ]; };
        "ui.linenr.selected" = {
          fg = white;
          bg = black;
          modifiers = [ "bold" ];
        };
        "ui.selection" = {
          fg = black;
          bg = blue;
        };
        "ui.selection.primary" = { modifiers = [ "reversed" ]; };
        "comment" = { fg = gray; };
        "ui.statusline" = {
          fg = white;
          bg = dark-gray;
        };
        "ui.statusline.inactive" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.help" = {
          fg = dark-gray;
          bg = white;
        };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "variable" = red;
        "variable.builtin" = orange;
        "constant.numeric" = orange;
        "constant" = orange;
        "attributes" = yellow;
        "type" = yellow;
        "ui.cursor.match" = {
          fg = yellow;
          modifiers = [ "underlined" ];
        };
        "string" = green;
        "variable.other.member" = red;
        "constant.character.escape" = cyan;
        "function" = blue;
        "constructor" = blue;
        "special" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = { modifiers = [ "underlined" ]; };
        "ui.gutter" = { bg = black; };
        "info" = blue;
        "hint" = dark-gray;
        "debug" = dark-gray;
        "warning" = yellow;
        "error" = red;
      };
    };
  };
}
