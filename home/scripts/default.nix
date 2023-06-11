{
  pkgs,
  config,
  ...
}: let
  scripts = pkgs.scripts.override {
    mpv = config.programs.mpv.package;
    rofi = config.programs.rofi.package;
  };
in {
  home = {
    packages = [scripts];

    # Link the scripts to home
    file.bin.source = "${scripts}/bin";
  };
}
