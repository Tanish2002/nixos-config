{ pkgs, theme, ... }:
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
      # lsp.display-messages = true;
      editor.true-color = true;
      keys.normal = {
        space = {
          space = "file_picker";
          w = ":w";
          q = ":q";
        };
      };
    };
  };
}
