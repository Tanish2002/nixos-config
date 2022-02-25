{ pkgs, ... }: { imports = [ ./gtk ./cursor ];
nixpkgs.config.joypixels.acceptLicense = true;
home.packages = [ pkgs.nerdfonts pkgs.joypixels ];
}
