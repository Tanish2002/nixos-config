{pkgs, ...}: {
  imports = [./vscode ./ssh ./helix ./nvim ./emacs ./direnv];
  programs = {
    git = {
      enable = true;
      userName = "Tanish2002";
      userEmail = "tanishkhare@gmail.com";
      diff-so-fancy.enable = true;
    };
  };
  # LSP
  home.packages = with pkgs; [
    # Nix
    nil
    statix
    deadnix
    # Misc
    unstable.postman
    dbeaver
    zip
    unzip
    gh
    (callPackage ./leetcode-cli {}) # leetcode-cli
  ];
}
