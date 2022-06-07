{ pkgs, inputs, ... }:
let stable = inputs.nixpkgs-2105.legacyPackages.x86_64-linux;
in {
  imports = [ ./vscode ./ssh ./helix ./nvim ./emacs ];
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
    # Misc
    postman
    jetbrains.datagrip
    stable.mysqlWorkbench # Later Versions of nixpkgs have broken mysqlworkbench
    zip
    # Rust
    cargo
    rustc
    rust-analyzer
    # Golang
    go_1_18
    gopls
    # Python
    python39
    python39Packages.python-lsp-server
  ];
}
