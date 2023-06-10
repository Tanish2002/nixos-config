{
  pkgs,
  inputs,
  ...
}: let
  # Hacky Fix for nix autocomplete(Credit: https://github.com/NobbZ/nixos-config/blob/63ddd01c21c692af1096272162e0e8c8a82d0525/home/modules/profiles/base/default.nix#L11)
  zsh-complete = pkgs.stdenv.mkDerivation {
    pname = "nix-zsh-completion-with-flakes";
    version = "git";

    src = ./nix-completions.sh;

    phases = ["installPhase"];

    installPhase = ''
      mkdir -p $out
      cp $src $out/_nix
    '';
  };
in {
  programs.zsh = {
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    plugins = with pkgs; [
      #Fix for nix autocomplete
      {
        name = "nix-zsh-complete.zsh";
        src = zsh-complete;
        file = "_nix";
      }
      #Better Tab Completion
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      #History Search
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
      }
      # Sane Defaults
      {
        name = "zimfw-input";
        src = fetchFromGitHub {
          owner = "zimfw";
          repo = "input";
          rev = "cd90ab172366f73ce7efbaa69acd587c350bd03d";
          sha256 = "4BtU7d2hJi2L7r+6wdmDddPi5459yEZyZiZJeKAfFfw=";
        };
        file = "init.zsh";
      }
      {
        name = "nix-zsh-completions";
        src = inputs.nix-zsh-completions;
      }
      {
        name = "zsh-nix-shell";
        src = pkgs.zsh-nix-shell;
        file = "share/zsh-nix-shell/nix-shell.plugin.zsh";
      }
    ];
  };
}
