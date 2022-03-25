{ pkgs, ... }: {
  imports = [ ./vscode ./ssh ];
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
    # Rust
    rustup
    rust-analyzer
    # Golang
    go
    gopls
    # Python
    python39
    python39Packages.python-lsp-server
    ];
}
