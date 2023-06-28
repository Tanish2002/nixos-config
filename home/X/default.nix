{theme, ...}:
with theme.config; {
  imports = [./dwm ./xmonad];
  xresources.extraConfig = ''
    *.alpha: 1
    *.termname: st-256color
    *.font: ${font1}:pixelsize=${font1_size}
    *.font2: ${font2}:pixelsize=${font2_size}
    *.cursorcolor: #${cc}
    *.cursorshape: ${cursorshape}

    ! special
    *.foreground:   #${fg}
    *.background:   #${bg}
    *.cursorColor:  #${fg}
    ! black
    *.color0:       #${c0}
    *.color8:       #${c8}
    ! red
    *.color1:       #${c1}
    *.color9:       #${c9}
    ! green
    *.color2:       #${c2}
    *.color10:      #${c10}
    ! yellow
    *.color3:       #${c3}
    *.color11:      #${c11}
    ! blue
    *.color4:       #${c4}
    *.color12:      #${c12}
    ! magenta
    *.color5:       #${c5}
    *.color13:      #${c13}
    ! cyan
    *.color6:       #${c6}
    *.color14:      #${c14}
    ! white
    *.color7:       #${c7}
    *.color15:      #${c15}
  '';
}
