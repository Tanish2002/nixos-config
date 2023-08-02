{pkgs, ...}: {
  home.packages = with pkgs; [
    # neovim
    neovim-tanish2002
  ];
}
