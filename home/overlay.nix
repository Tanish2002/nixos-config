{ pkgs, lib, ... }:
let
  nixGLIntel = (pkgs.callPackage
    (pkgs.fetchFromGitHub {
      owner = "guibou";
      repo = "nixGL";
      rev = "c4aa5aa15af5d75e2f614a70063a2d341e8e3461";
      sha256 = "rfA7lqV+cR3bQt4lT2F+6qrIzJSPloJaGVATR9u+5yY=";
    })
    { }).nixGLIntel;
  wrapped = pkgs.writeShellScriptBin "picom" ''
    #!${pkgs.stdenv.shell}
    exec ${nixGLIntel}/bin/nixGLIntel ${pkgs.picom}/bin/picom "$@"
  '';
in

pkgs.symlinkJoin {
  name = "picom";
  paths = [
    wrapped
    pkgs.picom.overrideAttrs (oldAttrs: {
      src = pkgs.fetchFromGitHub {
        owner = "jonaburg";
        repo = "picom";
        rev = "a8445684fe18946604848efb73ace9457b29bf80";
        sha256 = "R+YUGBrLst6CpUgG9VCwaZ+LiBSDWTp0TLt1Ou4xmpQ=";
      };
    })
  ];
}
