{pkgs, ...}: {
  services = {
    picom = {
      enable = true;
      backend = "glx";
      extraArgs = ["--experimental-backends"];
      package = pkgs.picom-dccsillag;
      # Shadows
      shadow = false;
      shadowOffsets = [10 10];
      shadowOpacity = 0.50;
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
      settings = {
        #Blur
        blur = {
          enable = true;
          method = "dual_kawase";
          strength = 4;
          background = false;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        };
        blur-background-exclude = ["class_g = 'slop'" "_GTK_FRAME_EXTENTS@:c" "class_g = 'Polybar'"];

        detect-client-opacity = true;

        # Animations
        animations = true;
      };

      # Fade
      fade = true;
      fadeDelta = 6;
      fadeSteps = [0.03 0.03];

      #Opacity Rules
      opacityRules = ["0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"];
    };
  };
}
