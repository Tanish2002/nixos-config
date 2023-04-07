{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "adi1090x-plymouth";
  version = "0.0.1";

  pack = "pack_1";
  theme = "blockchain";

  src = fetchFromGitHub {
    owner = "adi1090x";
    repo = "plymouth-themes";
    rev = "bf2f570bee8e84c5c20caac353cbe1d811a4745f";
    sha256 = "sha256-VNGvA8ujwjpC2rTVZKrXni2GjfiZk7AgAn4ZB4Baj2k=";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/plymouth/themes
    cp -r ${pack}/${theme} $out/share/plymouth/themes
    cat ${pack}/${theme}/${theme}.plymouth | sed  "s@\/usr\/@$out\/@" > $out/share/plymouth/themes/${theme}/${theme}.plymouth
  '';
}
