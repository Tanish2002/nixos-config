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
  home.packages = with pkgs; [ rnix-lsp ];
}
