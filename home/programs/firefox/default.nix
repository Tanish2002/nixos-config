{
  pkgs,
  theme,
  ...
}: let
  firefox-work = pkgs.makeDesktopItem {
    name = "firefox-work";
    desktopName = "Firefox Work";
    exec = "${pkgs.firefox}/bin/firefox -P work";
  };
in {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox.override {
        # Changes Default newTab Page to a custom one.
        extraPrefs = ''
          var {classes:Cc,interfaces:Ci,utils:Cu} = Components;
          /* set new tab page */
          try {
            Cu.import("resource:///modules/AboutNewTab.jsm");
            var newTabURL = "file://${
            pkgs.writeText "index.html"
            "${import ./newTab/index.html.nix {inherit pkgs theme;}}"
          }";
            AboutNewTab.newTabURL = newTabURL;
            } catch(e){Cu.reportError(e);} // report errors in the Browser Console
        '';
      };
      profiles = {
        personal = {
          id = 0;
          userChrome = import ./css/userChrome.nix theme;
          userContent = import ./css/userContent.nix;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "general.smoothScroll" = true;
          };
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            (buildFirefoxXpiAddon {
              pname = "adaptive-tab-bar-color";
              version = "2.1.4";
              addonId = "ATBC@EasonWong";
              url = "https://addons.mozilla.org/firefox/downloads/file/4159211/adaptive_tab_bar_colour-2.1.4.xpi";
              sha256 = "sha256-QB4GQEiCbdYn8CBD7gQIG3yu0ZEWHz3nzInCK0oiL/g=";
              meta = {};
            })
            ublock-origin
            hoppscotch
            stylus
            bitwarden
          ];
        };
        work = {
          id = 1;
          userChrome = import ./css/userChrome.nix theme;
          userContent = import ./css/userContent.nix;
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "general.smoothScroll" = true;
          };
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            hoppscotch
            ublock-origin
            stylus
            bitwarden
          ];
        };
      };
    };
  };
  home.packages = [firefox-work];
}
