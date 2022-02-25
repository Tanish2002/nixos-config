{ pkgs, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      colorpicker-ym1234 = prev.colorpicker.overrideAttrs (o: {
        src = pkgs.fetchFromGitHub {
          owner = "ym1234";
          repo = "colorpicker";
          rev = "3b5076f5bb3392830e7d1d97fa86621ca19c4d1a";
          sha256 = "lt8l387Kc3RGCTEcE+zIf0sXdLrmVVu3L6qhhSlEQ2Q=";
        };
      });
      # Imagemagick package is kinda broken :(
      imagemagick-patch = prev.imagemagick.overrideAttrs (o: {
        nativeBuildInputs = o.nativeBuildInputs ++ [ pkgs.curl ];
      });
    })
  ];
  home = {
    packages = with pkgs; [
      file
      maim
      libnotify
      cpufrequtils
      xdotool
      colorpicker-ym1234
      youtube-dl
      imagemagick-patch
    ];
    file.bin = { source = inputs.bin; };
  };
}
