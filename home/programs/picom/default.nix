{ pkgs, lib, inputs, ... }: {
  services = {
    picom = {
      enable = true;
      backend = "glx";
      experimentalBackends = true;
      package = pkgs.picom.overrideAttrs (o: {
        src = inputs.picom-git;
        buildInputs = o.buildInputs ++ [ pkgs.xorg.xcbutilwm ];
      });
      # Shadows
      shadow = false;
      shadowOffsets = [ 10 10 ];
      shadowOpacity = "0.50";
      shadowExclude = [
        "name = 'Notification'"
        "name *= 'polybar'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'slop'"
        "class_g = 'polybar'"
        "class_g = 'Conky'"
        "class_g = 'xscreen'"
        "_NET_WM_STATE@:32a = '_NET_WM_STATE_FULLSCREEN'"
      ];

      # Fade
      fade = true;
      fadeDelta = 6;
      fadeSteps = [ "0.03" "0.03" ];

      #Blur
      blur = true;
      blurExclude =
        [ "class_g = 'slop'" "_GTK_FRAME_EXTENTS@:c" "class_g = 'Polybar'" ];

      #Opacity Rule
      opacityRule = [ "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'" ];
      extraOptions = ''
        detect-client-opacity = true;
        blur: {
          method = "dual_kawase";
          strength = 4;
          background = false;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        }
      '';
    };
  };
}
