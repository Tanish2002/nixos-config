{ theme }: {
  "colours" = {
    background = {
      text = "#090909";
      alt = "#121212";
    };
    foreground = {
      text = "#f55966";
      alt = "#E087A9";
    };
    base02 = "#2b4c4a";
    base10 = "#355957";
    base15 = "#eaddde";
    base03 = "#cbc037";
  };
  "bar/main" = {
    monitor = "eDP";
    override.redirect = false;
    font = [
      "VictorMono Nerd Font Mono:style=Bold:size=12;3"
      "FontAwesome:style=Regular:pixelsize=12;3"
      "Kochi Gothic:style=Regular-Mono:pixelsize=12;3"
      "Font Awesome 5 Brands:pixelsize=12;3"
    ];
    #font-0 = VictorMono Nerd Font Mono:style=Bold:size=12;3
    #font-1 = FontAwesome:style=Regular:pixelsize=12;3  
    #font-2 = Osaka-Mono:style=Regular-Mono:pixelsize=12;3
    #font-3 = Font Awesome 5 Brands:pixelsize=12;3

    enable.ipc = true;

    width = "100%";
    height = 45;
    bottom = true;
    fixed.center = true;
    line.size = 2;

    tray.position = "left";
    #;tray-detached = true;
    #;tray-maxsize = 16;
    #tray-background = "#121212";
    #;tray-offset-x = 0;
    #;tray-offset-y = 0;
    #;tray-padding = 1;

    background = "#090909";
    foreground = "#f55966";

    cursor = {
      click = "pointer";
      scroll = "ns-resize";
    };
    modules = {
      left = "wlan volume battery layout";
      center = "mpv vpn";
      right = "date workspaces menu-apps";
    };
  };

  "module/workspaces" = {
    type = "internal/xworkspaces";

    format = {
      text = "<label-state>";
      background = "#121212";
      foreground = "#cbc037";
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

    # ; Separator in between workspaces
    # ;label-separator = |
    # ;label-separator-padding = 10
    # ;label-separator-foreground = #ffb52a
  };

  "module/battery" = {
    type = "internal/battery";

    battery = "BAT0";
    format = {
      discharging = {
        text = "<ramp-capacity><label-discharging>";
        padding = 2;
        background = "#121212";
      };
      charging = {
        text = "<animation-charging><label-charging>";
        padding = 2;
        background = "#121212";
      };
      full = {
        text = "%{F#355957}%{F-}<label-full>";
        background = "#121212";
      };
    };

    label = {
      discharging = {
        text = "%percentage:3%%";
        forground = "#E087A9";
      };
      charging = {
        text = "%percentage:3%%";
        forground = "#E087A9";
      };
      full = {
        text = "Charged";
        background = "#121212";
        forground = "#E087A9";
        padding = 2;
      };

    };
    ramp.capacity = [
      "%{F#355957}%{F-}"
      "%{F#355957}%{F-}"
      "%{F#355957}%{F-}"
      "%{F#355957}%{F-}"
      "%{F#355957}%{F-}"
    ];
    animation = {
      charging = [
        "%{F#355957}%{F-}"
        "%{F#355957}%{F-}"
        "%{F#355957}%{F-}"
        "%{F#355957}%{F-}"
        "%{F#355957}%{F-}"
      ];
      #; Framerate in milliseconds
      framerate = 750;
    };
  };

  "module/volume" = {
    type = "internal/pulseaudio";
    format.volume = {
      text = "<ramp-volume><label-volume>";
      padding = 2;
      background = "#121212";
    };
    label = {
      volume = {
        text = "%percentage:3%%";
        foreground = "#E087A9";
      };
      muted = {
        text = "F#cbc037}%{F-} %{F#E087A9}mute%{F-}";
        foreground = "#E087A9";
        background = "#121212";
        padding = 2;
      };
    };
    ramp.volume = [ "%{F#cbc037}%{F-}" ];
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
        text = "%{F#4c7399} %{F-}%ifname%";
        foreground = "#E087A9";
        background = "#121212";
        padding = 1;
      };
      disconnected = {
        text = "";
        foreground = "#E087A9";
        background = "#121212";
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
      background = "#090909";
      foreground = "#E087A9";
    };
    time = {
      text = "%{F#eaddde} %{F-} %I:%M %p%";
      alt = "%{F#eaddde}%{F-} %d-%m-%Y%";
    };
  };
  "module/layout" = {
    type = "custom/script";

    exec = {
      text = "tail -F /tmp/xmonad-layout-name";
      "if" = "[ -p /tmp/xmonad-layout-name ]";
    };
    tail = true;
    format = {
      text = "<label>";
      background = "#121212";
      foreground = "f55966";
      padding = 1.5;
    };

    click.left = "sleep 0.1; xdotool key Super+space";
    label.text = "%output%";
  };
  "module/mpv" = {
    type = "custom/script";
    exec = {
      text = "/bin/sh -c $HOME/bin/song-name";
      "if" = "pgrep -x mpv";
    };
    format = {
      text = "<label>";
      prefix = "  ";
      padding = 3;
      foreground = "#0E0909";
      background = "#E087A9";
    };
    click = {
      left = "mpvctl -t";
      right = "mpvctl -q";
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
      background = "#121212";
      foreground = "#E087A9";
      padding = 3;
    };
    expand.right = true;
    menu = [
      [ # 0
        { # 0-0
          text = "";
          exec = "sleep 0.1; betterlockscreen -l dimblur";
        }
        { # 0-1
          text = "";
          exec =
            "notify-send 'Logging Out' && sleep 1 && kill -15 $(pidof Xorg)";
        }
        { # 0-2
          text = "";
          exec = "menu-open-1";
        }
      ]
      [ # 1
        { # 1-0
          text = "PowerOFF";
          exec =
            "notify-send ' Shutting Down ' && sleep 1 && sudo shutdown -P now";
        }
        { # 1-1
          text = "Reboot";
          exec = "notify-send ' Rebooting ' && sleep 1 && sudo reboot";
        }
      ]
    ];
    label = {
      open = "";
      close = "";
      separator = "      ";
    };
  };
  "module/vpn" = {
    type = "custom/script";
    exec = {
      text = "echo vpn";
      "if" = "pgrep -x openvpn";
    };
    interval = 5;
    format = {
      underline = "#268bd2";
      prefix = "🖧 ";
      prefix-foreground = "#5b";
    };
  };
}
