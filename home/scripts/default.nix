{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ file maim libnotify ];
    file.bin = { source = ./bin; };
  };
}
