{ pkgs, ... }: {
  programs = {
    mpv = {
      enable = true;
      config = { input-ipc-server = "/tmp/mpvsocket"; };
    };
  };
  xdg.configFile.mpvtube_playlists = {
    text = ''
      Sangeet @https://www.youtube.com/playlist?list=PL88kQYE_UywBzqdk0S9QrTwrGk6sTorBP
    '';
    target = "mpv/mpvtube_playlists";
  };
}
