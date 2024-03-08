{pkgs, ...}: let
  lfPackage = pkgs.lf;
in {
  imports = [./config.nix];
  programs.lf = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "lf";
      paths = [
        (pkgs.writeShellScriptBin "lf" ''
          set -e

          if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
          	${lfPackage}/bin/lf "$@"
          else
          	[ ! -d "$HOME/.cache/lf" ] && mkdir --parents "$HOME/.cache/lf"
          	${lfPackage}/bin/lf "$@" 3>&-
          fi
        '')
        lfPackage
      ];
    };
  };
}
