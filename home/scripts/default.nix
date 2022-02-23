{ pkgs, inputs, ... }: {
  home = {
    packages = with pkgs; [ file maim libnotify ];
    file.bin = { source = inputs.bin; };
  };
}
