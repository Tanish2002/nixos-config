{ pkgs, }: ''
  <!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <link rel="stylesheet" href="${
        pkgs.writeText "style.css" "${import ./css/style.css.nix { }}"
      }">
      <title>New Tab</title>
    </head>
    <body>
      <div class="container">
        <div class="prompt">[<span>weeb</span>@<span>firefox</span> ~]$ tree</div>
        <div class="tree">
          <h1>.</h1>
          <ul>
            <li>
              <h1>Git*</h1>
              <ul>
                <li><a href="https://gitlab.com/Tanish2002/dot-files">My Dots</a></li>
                <li><a href="https://gitlab.com/Tanish2002/st-tanish2002">My st</a></li>
                <li><a href="https://github.com/void-linux/void-packages">Void</a></li>
                <li><a href="https://github.com/mitchweaver/bin">Mitch's Scripts</a></li>
                <li><a href="https://github.com/6gk/polka">Anna's Dots</a></li>
              </ul>
            </li>
            <li>
              <h1>Reddit</h1>
              <ul>
                <li><a href="https://www.reddit.com/r/unixporn/">r/Unixporn</a></li>
                <li><a href="https://www.reddit.com/r/voidlinux/">r/VoidLinux</a></li>
              </ul>
            </li>
            <li>
              <h1>Anime</h1>
              <ul>
                <li><a href="https://gogoanime.tv/">Gogoanime</a></li>
                <li><a href="https://animixplay.to/">Animixplay</a></li>
              </ul>
            </li>
            <li>
              <h1>Miscellaneous</h1>
              <ul>
                  <li><a href="https://tanish2002.gitlab.io/">My Website</a></li>
                  <li><a href="https://voidlinux.org/packages/">Void Packages</a></li>
                  <li><a href="https://hackage.haskell.org/package/xmonad-contrib-0.16/docs/">Xmonad-Contrib</a></li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="prompt">[<span>weeb</span>@<span>firefox</span> ~]$ ddg</div>
        <form action="https://duckduckgo.com/" method="GET">
          <h1>search: </h1>
          <input type="text" name="q" autofocus="autofocus">
        </form>
      </div>
    </body>
  </html>
''
