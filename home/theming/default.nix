{pkgs, ...}: {
  imports = [./gtk ./cursor];
  nixpkgs.config.joypixels.acceptLicense = true;
  home.packages = with pkgs; [
    #nerdfonts
    joypixels
    (unstable.nerdfonts.override {fonts = ["FiraCode" "VictorMono" "Iosevka"];})
  ];
}
