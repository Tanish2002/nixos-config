{ pkgs, inputs, ... }: {

  nixpkgs.overlays = [
    (final: prev: {
      neovim = inputs.neovim-config.packages.x86_64-linux.default;
    })
  ];

  home.packages = [ pkgs.neovim ];
}
