{ pkgs, theme, ... }: {
  services.betterlockscreen = {
    enable = true;
    arguments = [ "dimblur" ];
  };
}
