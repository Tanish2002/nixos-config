{pkgs, ...}: {
  imports = [./gtk ./cursor];
  home.packages = with pkgs; [
    #nerdfonts
    joypixels
    (unstable.nerdfonts.override {fonts = ["FiraCode" "VictorMono" "Iosevka"];})
  ];
}
