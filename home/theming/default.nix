{ pkgs, ... }: { imports = [ ./gtk ];
home.packages = [ pkgs.nerdfonts ];
}
