{ pkgs, ... }:
let lfPackage = pkgs.lf;
in {
  imports = [ ./config.nix ];
  programs.lf = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "lf";
      paths = [
        (pkgs.writeShellScriptBin "lf" ''
          set -e
          cleanup() {
            exec 3>&-
          	${pkgs.coreutils}/bin/rm "$FIFO_UEBERZUG"
          }
          if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
          	${lfPackage}/bin/lf "$@"
          else
          	[ ! -d "$HOME/.cache/lf" ] && mkdir -p "$HOME/.cache/lf"
          	export FIFO_UEBERZUG="$HOME/.cache/lf/ueberzug-$$"
          	${pkgs.coreutils}/bin/mkfifo "$FIFO_UEBERZUG"
          	${pkgs.ueberzug}/bin/ueberzug layer -s <"$FIFO_UEBERZUG" -p json &
          	exec 3>"$FIFO_UEBERZUG"
          	trap cleanup HUP INT QUIT TERM PWR EXIT
          	${lfPackage}/bin/lf "$@" 3>&-
          fi
        '')
        lfPackage
      ];
    };
  };
}
