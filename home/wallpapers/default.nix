{ inputs, ... }: {
  home.file.Wallpapers = {
    source = inputs.wallpapers;
    recursive = true;
  };
}
