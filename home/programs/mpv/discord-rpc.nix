{
  stdenvNoCC,
  inputs,
  discord-rpc,
}:
stdenvNoCC.mkDerivation {
  pname = "mpv-discord-RPC";
  version = "git";
  src = inputs.mpv-discord-rpc;

  dontBuild = true;
  dontCheck = true;

  installPhase = ''
    mkdir -p $out/share/mpv
    mkdir -p $out/share/mpv/scripts
    cp -r mpv-discordRPC $out/share/mpv/scripts
  '';
  fixupPhase = ''
    substituteInPlace $out/share/mpv/scripts/mpv-discordRPC/lua-discordRPC.lua \
      --replace "discord-rpc" "${discord-rpc}/lib/libdiscord-rpc${stdenvNoCC.hostPlatform.extensions.sharedLibrary}"
  '';
  passthru.scriptName = "mpv-discordRPC";
}
