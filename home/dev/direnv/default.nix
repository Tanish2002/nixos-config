_: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    stdlib = ''
      : ''${XDG_CACHE_HOME:=$HOME/.cache}
      declare -A direnv_layout_dirs
      direnv_layout_dir() {
      	echo "''${direnv_layout_dirs[$PWD]:=$(
      		local hash="$(sha1sum - <<<"''${PWD}" | cut -c-7)"
      		local path="''${PWD//[^a-zA-Z0-9]/-}"
      		echo "''${XDG_CACHE_HOME}/direnv/layouts/''${hash}''${path}"
      	)}"
      }

    '';
  };
  programs.zsh.initExtra = ''
    nixify() {
      if [ ! -e ./.envrc ]; then
        echo "use nix" > .envrc
        direnv allow
      fi
      if [[ ! -e shell.nix ]] && [[ ! -e default.nix ]]; then
        cat > default.nix <<'EOF'
    with import <nixpkgs> {};
    mkShell {
      nativeBuildInputs = [
        bashInteractive
      ];
    }
    EOF
        ''${"EDITOR:-vim"} default.nix
      fi
    }
    flakify() {
      if [ ! -e flake.nix ]; then
        nix flake new -t github:nix-community/nix-direnv .
      elif [ ! -e .envrc ]; then
        echo "use flake" > .envrc
        direnv allow
      fi
      ''${"EDITOR:-vim"} flake.nix
    }
  '';
}
