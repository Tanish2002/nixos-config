''
  @import url("${./userChrome.nix}");

  /* Removes white loading page */
  @-moz-document url(about:blank), url(about:newtab), url(about:home) {
    html:not(#ublock0-epicker),
    html:not(#ublock0-epicker) body,
    #newtab-customize-overlay {
      background: var(--mff-bg) !important;
    }
  }

  /* Hide scrollbar */

  :root {
    scrollbar-width: none !important;
  }

  @-moz-document url(about:privatebrowsing) {
    :root {
      scrollbar-width: none !important;
    }
  }
''
