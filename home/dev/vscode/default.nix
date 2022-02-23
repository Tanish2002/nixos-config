{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs; [
      vscode-extensions.bbenoist.nix
      vscode-extensions.brettm12345.nixfmt-vscode
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.dracula-theme.theme-dracula
      vscode-extensions.pkief.material-icon-theme
      vscode-extensions.golang.go
    ];
  };
  home.packages = with pkgs; [ rnix-lsp ];
}
