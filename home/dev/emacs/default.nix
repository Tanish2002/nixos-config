{ pkgs, inputs, config, lib, ... }:
let
  cpl-src = pkgs.fetchFromGitHub {
    repo = "copilot.el";
    owner = "zerolfx";
    rev = "9b13478720581580a045ac76ad68be075466a963";
    sha256 = "sha256-urdewIQbtd579Km592plyg9LuQdcw6nvXpt/aF0hLAs=";
  };
  # Extra packages that should be available to emacs
  extraBins = with pkgs; [
    unzip
    deno
    python3
    ripgrep
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science ]))
  ];
in rec {
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
