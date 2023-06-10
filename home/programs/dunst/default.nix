{
  pkgs,
  theme,
  ...
}:
with theme.config; {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "VictorMono Nerd Font Mono Bold 13px";
        monitor = 0;
        follow = "none";
        geometry = "500x5-40+40";
        shrink = true;

        # borders
        padding = 15;
        horizontal_padding = 15;
        frame_width = 0;
        frame_color = "#a8b67a";
        separator_height = 2;
        separator_color = "frame";

        markup = "full";
        format = ''
          <b>%s</b>
          %b'';
        alignment = "center";
        word_wrap = true;

        dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst:";
        browser = "${pkgs.firefox}/bin/firefox -new-tab";

        idle_threshold = 120;
        show_indicators = false;
        show_age_threshold = 60;

        icon_position = "left";
        max_icon_size = 128;
      };
      experimental = {per_monitor_dpi = true;};
      shortcuts = {
        #close              = ctrl+space
        close_all = "ctrl+shift+space";
        history = "ctrl+shift+grave";
        context = "ctrl+shift+period";
      };
      urgency_low = {
        background = "#${dbg}";
        foreground = "#${c9}";
        frame_color = "#${cc}";
        timeout = 5;
      };
      urgency_normal = {
        background = "#${dbg}";
        foreground = "#${c9}";
        frame_color = "#${cc}";
        timeout = 5;
      };
      urgency_critical = {
        background = "#${dbg}";
        foreground = "#${c9}";
        frame_color = "#${cc}";
        timeout = 0;
      };
    };
  };
}
