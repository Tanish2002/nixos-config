{
  pkgs,
  inputs,
  theme,
  ...
}: {
  gtk = with theme.config; {
    enable = true;
    theme = let
      phocus = pkgs.stdenvNoCC.mkDerivation {
        name = "phocus";
        src = inputs.phocus;
        postPatch = ''
          substituteInPlace "scss/gtk-3.0/_colors.scss" \
          --replace "\$surface-strongest: rgb(10, 10, 10)"        "\$surface-strongest: #${dbg}" \
          --replace "\$surface-strong: rgb(20, 20, 20)"           "\$surface-strong: lighten(#${dbg}, 2%)" \
          --replace "\$surface-moderate: rgb(28, 28, 28)"         "\$surface-moderate: lighten(#${dbg}, 4%)" \
          --replace "\$surface-weak: rgb(34, 34, 34)"             "\$surface-weak: lighten(#${dbg}, 8%)" \
          --replace "\$surface-weakest: rgb(40, 40, 40)"          "\$surface-weakest: lighten(#${dbg}, 10%)" \
          --replace "\$white-strongest: rgb(255, 255, 255)"       "\$white-strongest: #${c15}" \
          --replace "\$white-strong: rgba(255, 255, 255, 0.87)"   "\$white-strong: rgba(#${c15}, 0.87)" \
          --replace "\$white-moderate: rgba(255, 255, 255, 0.34)" "\$white-moderate: rbga(#${c15}, 0.34)" \
          --replace "\$white-weak: rgba(255, 255, 255, 0.14)"     "\$white-weak: rbga(#${c15}, 0.14)" \
          --replace "\$white-weakest: rgba(255, 255, 255, 0.06)"  "\$white-weakest: rgba(#${c15}, 0.06)" \
          --replace "\$black-strongest: rgb(0, 0, 0)"             "\$black-strongest: #${c0}" \
          --replace "\$black-strong: rgba(0, 0, 0, 0.87)"         "\$black-strong: rgba(#${c0}, 0.87)" \
          --replace "\$black-moderate: rgba(0, 0, 0, 0.42)"       "\$black-moderate: rgba(#${c0}, 0.42)" \
          --replace "\$black-weak: rgba(0, 0, 0, 0.15)"           "\$black-weak: rgba(#${c0}, 0.15)" \
          --replace "\$black-weakest: rgba(0, 0, 0, 0.06)"        "\$black-weakest: rgba(#${c0}, 0.06)" \
          --replace "\$red-normal: rgb(218, 88, 88)"              "\$red-normal: #${c1}" \
          --replace "\$red-light:rgb(227, 109, 109)"              "\$red-light: #${c9}" \
          --replace "\$orange-normal: rgb(237, 148, 84)"          "\$orange-normal: mix(#${c1}, #${c3}, 50%)" \
          --replace "\$orange-light: rgb(252, 166, 105)"          "\$orange-light: mix(#${c9}, #${c11}, 50%)" \
          --replace "\$yellow-normal: rgb(232, 202, 94)"          "\$yellow-normal: #${c3}" \
          --replace "\$yellow-light: rgb(250, 221, 117)"          "\$yellow-light: #${c11}" \
          --replace "\$green-normal: rgb(63, 198, 97)"            "\$green-normal: #${c2}" \
          --replace "\$green-light: rgb(97, 214, 126)"            "\$green-light: #${c10}" \
          --replace "\$cyan-normal: rgb(92, 216, 230)"            "\$cyan-normal: #${c6}" \
          --replace "\$cyan-light: rgb(126, 234, 246)"            "\$cyan-light: #${c14}" \
          --replace "\$blue-normal: rgb(73, 126, 233)"            "\$blue-normal: #${c4}" \
          --replace "\$blue-light: rgb(93, 141, 238)"             "\$blue-light: #${c12}" \
          --replace "\$purple-normal: rgb(113, 84, 242)"          "\$purple-normal: #${c5}" \
          --replace "\$purple-light: rgb(128, 102, 245)"          "\$purple-light: #${c13}" \
          --replace "\$pink-normal: rgb(213, 108, 195)"           "\$pink-normal:  mix(#${c1}, #${c7}, 50%)" \
          --replace "\$pink-light: rgb(223, 129, 207)"            "\$pink-light: mix(#${c9}, #${c15}, 50%)"
        '';
        patches = [./remove-npm-install.diff ./gradient.diff];
        nativeBuildInputs = [pkgs.nodePackages.sass pkgs.nodejs];
        installFlags = ["DESTDIR=$(out)" "PREFIX="];
      };
    in {
      package = phocus;
      name = "phocus";
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font.name = "Iosevka Nerd Font Mono";
  };
}
