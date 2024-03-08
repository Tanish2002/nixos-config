{pkgs, ...}: {
  imports = [./vscode ./ssh ./helix ./nvim ./direnv ./tmux ./zellij];
  programs = {
    git = {
      enable = true;
      userName = "Tanish2002";
      userEmail = "tanishkhare@gmail.com";
      diff-so-fancy.enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
  # LSP
  home.packages = with pkgs; [
    # Nix
    nil
    statix
    deadnix
    # Misc
    old.postman
    insomnia
    mysql-workbench
    altair
    dbeaver
    zip
    unzip
    gh
    (callPackage ./leetcode-cli {}) # leetcode-cli
  ];
}
