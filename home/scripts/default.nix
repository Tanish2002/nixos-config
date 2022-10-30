{ pkgs, inputs, config, ... }: {
  nixpkgs.overlays =
    [ (final: prev: { scripts = inputs.bin.packages.x86_64-linux.default; }) ];
  home = {
    packages = with pkgs;
      [
        (scripts.override {
          mpv = config.programs.mpv.package;
          rofi = config.programs.rofi.package;
        })
      ];

    # Link the scripts to home
    file.bin.source = "${pkgs.scripts}/bin";
  };
}
