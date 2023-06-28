{pkgs, ...}: {
  # I have this just because it's nice to have in some scenarious
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jnoortheen.nix-ide
      dracula-theme.theme-dracula
      pkief.material-icon-theme
      golang.go
    ];
  };
}
