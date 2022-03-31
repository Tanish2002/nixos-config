{ pkgs, ... }: {
  imports = [ ./gtk ./cursor ];
  nixpkgs.config.joypixels.acceptLicense = true;
  home.packages = with pkgs; [
    #nerdfonts
    joypixels
    (nerdfonts.override { fonts = [ "FiraCode" "VictorMono" "Iosevka" ]; })
  ];
}
