_: {
  imports = [./looking-glass.nix ./pciPassthrough.nix];
  pciPassthrough = {
    enable = true;
    pciIDs = "10de:1f95,10de:10fa";
    libvirtUsers = ["weeb"];
  };
  programs.looking-glass = {
    enable = true;
    shm.user = "weeb";
  };
}
