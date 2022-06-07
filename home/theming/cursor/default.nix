{ pkgs, inputs, theme, ... }: {
  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "phinger-cursors-light";
    };
  };
}
