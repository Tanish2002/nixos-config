{ pkgs, inputs, ... }: {
  programs.mpv = {
    enable = true;
    # TODO: Use stable mpv when https://github.com/NixOS/nixpkgs/pull/221071 gets added to stable
    package = pkgs.wrapMpv (pkgs.unstable.mpv-unwrapped.override {
      lua = pkgs.luajit; # use liajit instead of lua so discord-rpc works
      sixelSupport = true;
    }) {
      youtubeSupport = true;
      scripts = [ (pkgs.callPackage ./discord-rpc.nix { inherit inputs; }) ];
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
      '';
      target = "mpv/mpvtube_playlists";
    };
  };
}
