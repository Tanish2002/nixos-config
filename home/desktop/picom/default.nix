{ pkgs, lib, inputs, ... }:
let nixGLIntel = (pkgs.callPackage 
  (pkgs.fetchFromGitHub {
       owner = "guibou";
       repo = "nixGL";
       rev = "c4aa5aa15af5d75e2f614a70063a2d341e8e3461";
       sha256 = "rfA7lqV+cR3bQt4lT2F+6qrIzJSPloJaGVATR9u+5yY=";
  }) { }).nixGLIntel;
in
{
  services = {
    picom = {
      enable = true;
      backend = "glx";
      experimentalBackends = true;
      #package = pkgs.picom.overrideAttrs (o: {
      #  src = pkgs.fetchFromGitHub {
      #    repo = "picom";
      #    owner = "Tanish2002";
      #    rev = "9221921f9fbcad197ed6241dcfbe32d361842d6a";
      #    sha256 = "YZU10XVeAyKIkk4TlU+Od525JGfcfEgPYSzZVW/8SKI=";
      #  };
      #  buildInputs = o.buildInputs ++ [ pkgs.xorg.xcbutilwm ];
      #  postInstall = o.postInstall or "" + ''
      #     mv $out/bin/picom $out/bin/.picom.wrapped
      #     cat <<EOF > $out/bin/picom
      #     #!${pkgs.runtimeShell}
      #     exec ${nixGLIntel}/bin/nixGLIntel $out/bin/.picom.wrapped \$@
      #     EOF
      #     chmod +x $out/bin/picom
      # '';
      #});
      package = inputs.picom-git;
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
      blurExclude = [
        "class_g = 'slop'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'Polybar'"
      ];

      #Opacity Rule
      opacityRule = [
        "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
      ];
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
