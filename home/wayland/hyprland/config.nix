{
  pkgs,
  theme,
  config,
}:
with theme.config; ''

  # Startup
  exec=${pkgs.swaybg}/bin/swaybg -i ${config.home.homeDirectory}/Wallpapers/${wallpaper}
  exec=systemctl --user restart foot.service

  ## Required Env Vars
  exec=systemctl --user import-environment
  exec=export WAYLAND_DISPLAY=wayland-0
  exec=systemctl --user import-environment WAYLAND_DISPLAY
  exec=dbus-update-activation-environment WAYLAND_DISPLAY
  exec=export XDG_SESSION_TYPE=wayland
  exec=export XDG_CURRENT_DESKTOP=sway
  exec=systemctl --user import-environment XDG_SESSION_TYPE XDG_CURRENT_DESKTOP


  monitor=,1920x1080@60,0x0,1

  input {
  follow_mouse=0
      touchpad {
          disable_while_typing=0
      }
  }

  general {
      max_fps=60
      sensitivity=1
      main_mod=SUPER

      gaps_in=5
      gaps_out=20
      border_size=0
      col.active_border=0x66ee1111
      col.inactive_border=0x66333333
  }

  decoration {
      rounding=10
  }

  animations {
      enabled=1
      speed=1
      windows_speed=6 # specific speeds for components can be made with name_speed=float. 0 means use global (speed=float). If not set, will use the global value.
      windows=1
      borders=1
      borders_speed=20
      fadein=1 # fade in AND out
      fadein_speed=1
  }
  dwindle {
      pseudotile=1
  }

  # Window Rules
  windowrule=float,Firefox — Sharing Indicator
  windowrule=move 50% 0%,Firefox — Sharing Indicator
  windowrule=workspace 1, Firefox
  windowrule=workspace 6, Discord

  # basic binds
  bind=SUPER,return,exec, ${config.programs.foot.package}/bin/footclient
  bind=SUPERSHIFT,return,exec, ${config.programs.foot.package}/bin/foot
  bind=SUPER,d,exec, ${config.programs.rofi.package}/bin/rofi -show drun
  bind=SUPER,T,exec,alacritty
  bind=SUPERSHIFT,Q,killactive,
  bind=SUPERSHIFT,escape,exec,pkill Hyprland
  bind=SUPER,P,pseudo
  bind=SUPER,F,togglefloating
  bind=SUPERSHIFT,F,fullscreen

  # Move Focus
  bind=SUPER,tab,movefocus,r
  bind=SUPER,left,movefocus,l
  bind=SUPER,right,movefocus,r
  bind=SUPER,up,movefocus,u
  bind=SUPER,down,movefocus,d

  # Move Window
  bind=SUPERSHIFT,left,movewindow,l
  bind=SUPERSHIFT,right,movewindow,r
  bind=SUPERSHIFT,up,movewindow,u
  bind=SUPERSHIFT,down,movewindow,d

  # Switch Workspace
  bind=SUPER,1,workspace,1
  bind=SUPER,2,workspace,2
  bind=SUPER,3,workspace,3
  bind=SUPER,4,workspace,4
  bind=SUPER,5,workspace,5
  bind=SUPER,6,workspace,6

  # Move window to workspace
  bind=SUPERSHIFT,exclam,movetoworkspace,1
  bind=SUPERSHIFT,at,movetoworkspace,2
  bind=SUPERSHIFT,numbersign,movetoworkspace,3
  bind=SUPERSHIFT,dollar,movetoworkspace,4
  bind=SUPERSHIFT,percent,movetoworkspace,5
  bind=SUPERSHIFT,asciicircum,movetoworkspace,6
''
