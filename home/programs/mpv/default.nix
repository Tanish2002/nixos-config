{
  pkgs,
  inputs,
  ...
}: {
  programs.mpv = {
    enable = true;
    package =
      pkgs.wrapMpv
      (pkgs.mpv-unwrapped.override {
        lua = pkgs.luajit; # use liajit instead of lua so discord-rpc works
        sixelSupport = true;
      })
      {
        youtubeSupport = true;
        scripts = [(pkgs.callPackage ./discord-rpc.nix {inherit inputs;})];
      };
    config = {
      input-ipc-server = "/tmp/mpvsocket";
      sub-auto = "all";
    };
  };
  xdg.configFile = {
    "mpv_discordRPC.conf" = {
      text = ''
        rpc_wrapper=lua-discordRPC
        periodic_timer=1
        playlist_info=yes
        hide_url=no
        loop_info=yes
        cover_art=yes
        mpv_version=yes
        active=yes
        key_toggle=D
      '';
      target = "mpv/script-opts/mpv_discordRPC.conf";
    };
    mpvtube_playlists = {
      text = ''
        Sangeet @https://www.youtube.com/playlist?list=PL88kQYE_UywBzqdk0S9QrTwrGk6sTorBP
        Chill @https://youtube.com/playlist?list=PLgzTt0k8mXzEpH7-dOCHqRZOsakqXmzmG
        JPop @https://listen.moe/stream
        Kpop @https://listen.moe/kpop/stream
        Hungama @http://103.16.47.70:7222/
        Mirchi @http://peridot.streamguys.com:7150/Mirchi
      '';
      target = "mpv/mpvtube_playlists";
    };
  };
}
