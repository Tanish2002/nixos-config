{ pkgs, inputs, theme, ... }: {
  xsession.pointerCursor = {
    package = pkgs.unstable.phinger-cursors;
    name = "phinger-cursors-light";
    defaultCursor = "phinger-cursors-light";
  };
}
