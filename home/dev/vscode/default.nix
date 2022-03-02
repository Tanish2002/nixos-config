{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      brettm12345.nixfmt-vscode
      jnoortheen.nix-ide
      dracula-theme.theme-dracula
      pkief.material-icon-theme
      golang.go
    ];
  };
}
