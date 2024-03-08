{
  pkgs,
  theme,
  config,
}:
with theme.config; {
  "colours" = {
    background = {
      text = "#${dbg}";
      alt = "#${lbg}";
    };
    foreground = {
      text = "#${c9}";
      alt =
        if theme.config.name == "flower"
        then "#${pink}"
        else "#${c13}";
    };
  };
  "bar/main" = {
    monitor = "eDP";
    override.redirect = false;
    font = [
      "VictorMono Nerd Font Mono:style=Bold:size=12;3"
      "FontAwesome:style=Regular:pixelsize=12;3"
      "IPAGothic:style=Regular:pixelsize=12;3"
      "Font Awesome 5 Brands:pixelsize=12;3"
    ];

    enable.ipc = true;

    width = "100%";
    height = 45;
    bottom = true;
    fixed.center = true;
    line.size = 2;

    tray = {
      position = "left";
      background = "#${lbg}";
    };
    background = "#${dbg}";
    foreground = "#${c9}";

    cursor = {
      click = "pointer";
      scroll = "ns-resize";
    };
    modules = {
      left = "wlan volume battery layout";
      center = "mpv";
      right = "date workspaces menu-apps";
    };
  };

  "module/workspaces" = {
    type = "internal/xworkspaces";

    format = {
      text = "<label-state>";
      background = "#${lbg}";
      foreground = "#${c3}";
      padding = 1;
    };

    enable = {
      click = true;
      scroll = true;
    };
    reverse.scroll = true;

    label = {
      active = {
        text = "";
        padding = 1;
      };
      occupied = {
        text = "";
        padding = 1;
      };
      urgent = {
        text = "";
        padding = 1;
      };
      empty = {
        text = "•";
        padding = 1;
      };
    };
  };

  "module/battery" = {
    type = "internal/battery";

    battery = "BAT0";
    format = {
      discharging = {
        text = "<ramp-capacity><label-discharging>";
        padding = 2;
        background = "#${lbg}";
      };
      charging = {
        text = "<animation-charging><label-charging>";
        padding = 2;
        background = "#${lbg}";
      };
      full = {
        text = "%{F#${c2}}%{F-}<label-full>";
        background = "#${lbg}";
      };
    };

    label = {
      discharging = {
        text = "%percentage:3%%";
        forground =
          if theme.config.name == "flower"
          then "#${pink}"
          else "#${c13}";
      };
      charging = {
        text = "%percentage:3%%";
        forground =
          if theme.config.name == "flower"
          then "#${pink}"
          else "#${c13}";
      };
      full = {
        text = "Charged";
        background = "#${lbg}";
        forground =
          if theme.config.name == "flower"
          then "#${pink}"
          else "#${c13}";
        padding = 2;
      };
    };
    ramp.capacity = [
      "%{F#${c2}}%{F-}"
      "%{F#${c2}}%{F-}"
      "%{F#${c2}}%{F-}"
      "%{F#${c2}}%{F-}"
      "%{F#${c2}}%{F-}"
    ];
    animation = {
      charging = [
        "%{F#${c2}}%{F-}"
        "%{F#${c2}}%{F-}"
        "%{F#${c2}}%{F-}"
        "%{F#${c2}}%{F-}"
        "%{F#${c2}}%{F-}"
      ];
      framerate = 750;
    };
  };

  "module/volume" = {
    type = "internal/pulseaudio";
    format.volume = {
      text = "<ramp-volume><label-volume>";
      padding = 2;
      background = "#${lbg}";
    };
    label = {
      volume = {
        text = "%percentage:3%%";
        foreground =
          if theme.config.name == "flower"
          then "#${pink}"
          else "#${c5}";
      };
      muted = {
        text = "%{F#${c3}}%{F-} %{F#${
          if theme.config.name == "flower"
          then pink
          else c5
        }}mute";
        background = "#${lbg}";
        padding = 2;
      };
    };
    ramp.volume = ["%{F#${c3}} %{F-}"];
  };
  "module/wlan" = {
    type = "internal/network";

    interface = ''
      ''${env:DEFAULT_NETWORK_INTERFACE:enp5s0f4u2}
    '';
    unknown-as-up = true;
    interval = 5;
    label = {
      connected = {
        text = "%{F#${c4}}󰖩 %{F-}%ifname%";
        background = "#${lbg}";
        padding = 1;
      };
      disconnected = {
        text = "%{F#${c4}}󰖪 %{F-}Disconnected";
        background = "#${lbg}";
        padding = 1;
      };
    };
  };
  "module/date" = {
    type = "internal/date";
    interval = 30;
    label = {
      text = "%time%";
      padding = 2;
      background = "#${dbg}";
    };
    time = {
      text = "%{F#${fg}} %{F-} %I:%M %p%";
      alt = "%{F#${fg}}%{F-} %d-%m-%Y%";
    };
  };
  "module/layout" = {
    type = "custom/script";

    exec = {
      text = "${pkgs.coreutils}/bin/tail -F /tmp/xmonad-layout-name";
      "if" = "[ -p /tmp/xmonad-layout-name ]";
    };
    tail = true;
    format = {
      text = "<label>";
      background = "#${dbg}";
      foreground = "#${c9}";
      padding = 1.5;
    };

    click.left = "sleep 0.1; ${pkgs.xdotool}/bin/xdotool key Super+space";
    label.text = "%output%";
  };
  "module/mpv" = {
    type = "custom/script";
    exec = {
      text = "${config.home.homeDirectory}/bin/song-name";
      "if" = "${pkgs.procps}/bin/pgrep -x mpv";
    };
    format = {
      text = "<label>";
      prefix = "  ";
      padding = 3;
      foreground = "#${dbg}";
      background =
        if theme.config.name == "flower"
        then "#${pink}"
        else "#${c13}";
    };
    click = {
      left = "${config.home.homeDirectory}/bin/mpvctl -t";
      right = "${config.home.homeDirectory}/bin/mpvctl -q";
    };
    scroll = {
      up = "${config.home.homeDirectory}/bin/appvol mpv inc";
      down = "${config.home.homeDirectory}/bin/appvol mpv dec";
    };
    label = {
      text = "%output%";
      maxlen = 65;
    };
  };
  "module/menu-apps" = {
    type = "custom/menu";

    format = {
      text = "<label-toggle><menu>";
      background = "#${lbg}";
      foreground =
        if theme.config.name == "flower"
        then "#${pink}"
        else "#${c13}";
      padding = 3;
    };
    expand.right = true;
    menu = [
      [
        # 0
        {
          # 0-0
          text = "";
          exec = "sleep 0.1; ${pkgs.betterlockscreen}/bin/betterlockscreen -l dimblur";
        }
        {
          # 0-1
          text = "";
          exec = "${pkgs.libnotify}/bin/notify-send 'Logging Out' && sleep 1 && kill -15 $(pidof Xorg)";
        }
        {
          # 0-2
          text = "";
          exec = "menu-open-1";
        }
      ]
      [
        # 1
        {
          # 1-0
          text = "PowerOFF";
          exec = "${pkgs.libnotify}/bin/notify-send ' Shutting Down ' && sleep 1 && sudo shutdown -P now";
        }
        {
          # 1-1
          text = "Reboot";
          exec = "${pkgs.libnotify}/bin/notify-send ' Rebooting ' && sleep 1 && sudo reboot";
        }
      ]
    ];
    label = {
      open = "";
      close = "";
      separator = "      ";
    };
  };
}
