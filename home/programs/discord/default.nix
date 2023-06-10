{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: _: {
      discord-latest =
        inputs.discord-overlay.packages."${final.system}".discord;
    })
  ];
  programs.discocss = {
    enable = true;
    discordPackage = pkgs.discord-latest;
    discordAlias = true;
    css = import ./discordcss.nix;
  };
}
