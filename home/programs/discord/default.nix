{
  pkgs,
  config,
  lib,
  ...
}: let
  settingsJson = {
    openasar = {
      css = import ./discordcss.nix;
    };
  };
in {
  home.packages = [(pkgs.discord.override {withOpenASAR = true;})];
  home.activation.install-discord-theme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p "${config.xdg.configHome}/discord"
    if [ -e ${config.xdg.configHome}/discord/settings.json ]; then
      $DRY_RUN_CMD ${pkgs.jq}/bin/jq '.openasar.css = "${import ./discordcss.nix}"' ${config.xdg.configHome}/discord/settings.json > ${config.xdg.configHome}/discord/temp.json && $DRY_RUN_CMD mv ${config.xdg.configHome}/discord/temp.json ${config.xdg.configHome}/discord/settings.json
    else
      $DRY_RUN_CMD touch "${config.xdg.configHome}/discord/settings.json"
      $DRY_RUN_CMD echo '${builtins.toJSON settingsJson}' > ${config.xdg.configHome}/discord/settings.json
    fi
  '';
}
