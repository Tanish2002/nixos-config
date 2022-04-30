{ pkgs, theme, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: { emacs-ng = inputs.emacs-ng.packages.x86_64-linux.default; })
  ];
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    #emacsPackage = inputs.emacs-ng.packages.x86_64-linux.default;
    emacsPackage = pkgs.unstable.emacs28NativeComp;
    # emacsPackagesOverlay = self: super: {
    #   # fixes https://github.com/vlaci/nix-doom-emacs/issues/394
    #   # gitignore-mode = pkgs.emacsPackages.git-modes;
    #   # gitconfig-mode = pkgs.emacsPackages.git-modes;
    # };
  };
  #   home.packages = [ inputs.emacs-ng.packages.x86_64-linux.default ];
}
