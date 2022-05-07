{ pkgs, inputs, config, ... }: rec {
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    # emacsPackage = inputs.emacs-ng.packages.x86_64-linux.default;
    emacsPackage = pkgs.unstable.emacs28NativeComp;
  };
  services.emacs.enable = true;
}
