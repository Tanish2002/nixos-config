{ pkgs, ... }:
let
  firefox-work = pkgs.makeDesktopItem {
    name = "firefox-work";
    desktopName = "Firefox Work";
    exec = "${pkgs.firefox}/bin/firefox -P work";
  };
in {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland.override {
        # Changes Default newTab Page to a custom one.
        extraPrefs = ''
          var {classes:Cc,interfaces:Ci,utils:Cu} = Components;
          /* set new tab page */
          try {
            Cu.import("resource:///modules/AboutNewTab.jsm");
            var newTabURL = "file://${
              pkgs.writeText "index.html"
              "${import ./newTab/index.html.nix { inherit pkgs; }}"
            }";
            AboutNewTab.newTabURL = newTabURL;
            } catch(e){Cu.reportError(e);} // report errors in the Browser Console
        '';
      };
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        stylus
        bitwarden
      ];
      profiles = {
        personal = {
          id = 0;
          userChrome = import ./css/userChrome.nix;
          userContent = import ./css/userContent.nix;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "general.smoothScroll" = true;
          };
        };
        work = {
          id = 1;
          userChrome = import ./css/userChrome.nix;
          userContent = import ./css/userContent.nix;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "general.smoothScroll" = true;
          };
        };
      };
    };
  };
  home.packages = [ firefox-work ];
}
