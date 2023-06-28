{pkgs, ...}: {
  home.packages = with pkgs; [
    # neovim
    neovim-tanish2002
    unstable.neovide
    gcc
  ];
  programs.zsh.shellAliases.nvim = "neovide --nofork";
}
