{pkgs, ...}: {
  programs.discocss = {
    enable = true;
    discordPackage = pkgs.discord;
    discordAlias = true;
    css = import ./discordcss.nix;
  };
}
