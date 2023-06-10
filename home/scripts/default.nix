{
  pkgs,
  inputs,
  config,
  ...
}: let
  scripts = inputs.bin.packages.x86_64-linux.default.override {
    mpv = config.programs.mpv.package;
    rofi = config.programs.rofi.package;
  };
in {
  nixpkgs.overlays = [(_: _: {inherit scripts;})];
  home = {
    packages = [pkgs.scripts];

    # Link the scripts to home
    file.bin.source = "${pkgs.scripts}/bin";
  };
}
