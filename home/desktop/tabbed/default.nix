{ ... }:
{
#Overlay for custom build of tabbed, Installed in home.nix
  nixpkgs.overlays = [
    (final: prev: {
      tabbed-tanish2002 = prev.tabbed.overrideAttrs
        (o: {
          src = prev.fetchFromGitHub {
            owner = "Tanish2002";
            repo = "tabbed-tanish2002";
            rev = "0b80826a0b9d09d0e2950bab0ebebf7de3360e6d";
            sha256 = "OaAWj80kLV8F8T04/kXIODM40ocbAxbxSpyRDOoQJ7o=";
          };
        });
    })
  ];
}
