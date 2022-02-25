{ pkgs, ... }: { imports = [ ./gtk ./cursor ];
home.packages = [ pkgs.nerdfonts ];
}
