{pkgs, ...}: {
  programs.discocss = {
    enable = true;
    discordPackage = pkgs.discord-latest;
    discordAlias = true;
    css = import ./discordcss.nix;
  };
}
