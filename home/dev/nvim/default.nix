{ pkgs, ... }: {

  # Disabled until (https://github.com/pta2002/nixvim/issues/114) gets fixed.
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     neovim = inputs.neovim-config.packages.x86_64-linux.default;
  #   })
  # ];
  programs.neovim.enable = true;
  home.packages = with pkgs; [ neovide gcc ];
  programs.zsh.shellAliases.nvim = "neovide --nofork";
}
