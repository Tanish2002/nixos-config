{
  pkgs,
  lib,
  ...
}: let
  # Extra packages that should be available to emacs
  extraBins = with pkgs; [
    ripgrep
    (aspellWithDicts (dicts: with dicts; [en en-computers en-science]))
  ];
in {
  systemd.user.services.emacs.Unit = {
    After = ["graphical-session-pre.target"];
    PartOf = ["graphical-session.target"];
  };
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    emacsPackage = pkgs.emacs-gtk;
    extraConfig = ''
      (setq exec-path (append exec-path '( ${
        lib.strings.concatMapStringsSep " " (x: ''"${x}/bin"'') extraBins
      } )))
      (setenv "PATH" (concat (getenv "PATH") ":${
        lib.strings.concatMapStringsSep ":" (x: "${x}/bin") extraBins
      }"))
    '';
  };
  services.emacs.enable = true;
}
