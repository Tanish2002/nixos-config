{ pkgs, inputs, ... }:
let
  stable = inputs.nixpkgs-2105.legacyPackages.x86_64-linux;
in {
  imports = [ ./vscode ./ssh ./helix ];
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
    # Misc
    postman
    stable.mysqlWorkbench # Later Versions of nixpkgs have broken mysqlworkbench
    zip
    # Rust
    rustup
    rust-analyzer
    # Golang
    unstable.go
    gopls
    # Python
    python39
    python39Packages.python-lsp-server
  ];
}
