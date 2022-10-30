{ pkgs, inputs, ... }: {
  imports = [ ./vscode ./ssh ./helix ./nvim ./emacs ./direnv ];
  programs = {
    git = {
      enable = true;
      userName = "Tanish2002";
      userEmail = "tanishkhare@gmail.com";
    };
  };
  # LSP
  home.packages = with pkgs; [
    # Nix
    rnix-lsp
    statix
    # Golang
    go_1_18
    gopls
    # Web Dev
    nodejs
    python310Packages.livereload
    # Misc
    postman
    jetbrains.datagrip
    dbeaver
    zip
    gh
    rust-analyzer
  ];
}
