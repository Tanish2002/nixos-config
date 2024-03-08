{theme, ...}: {
  programs.zellij = {
    enable = true;
  };
  xdg.configFile."config.kdl" = {
    text = ''
      theme "catppuccin-mocha"
      on_force_close "quit";
      simplified_ui true;
      pane_frames false;
      mouse_mode false
      keybinds {
        shared_except "locked" {
          bind "Alt x" {
            CloseFocus; SwitchToMode "Normal"
          }
          bind "Alt \\" {
            ToggleFloatingPanes; SwitchToMode "Normal"
          }
        }
      }
    '';
    target = "zellij/config.kdl";
  };
  # xdg.configFile."default.kdl" = {
  #   text = ''
  #
  #     layout {
  #         pane size=1 borderless=true {
  #             plugin location="file:${pkgs.zjstatus}/bin/zjstatus.wasm" {
  #                 format_right  "{mode} {session}"
  #                 format_space "{tabs}"
  #                 format_left "#[bg=#1e1e2e]"
  #
  #                 border_enabled  "false"
  #
  #                 hide_frame_for_single_pane "true"
  #
  #                 mode_normal        "#[fg=#${theme.config.bg},bg=green,bold] {name} "
  #                 mode_locked        "#[fg=#${theme.config.bg},bg=red,bold] {name} "
  #                 mode_pane          "#[fg=#${theme.config.bg},bg=yellow,bold] {name} "
  #                 mode_tab           "#[fg=#${theme.config.bg},bg=pink,bold] {name} "
  #                 mode_search        "#[fg=#${theme.config.bg},bg=magenta,bold] {name} "
  #                 mode_session       "#[fg=#${theme.config.bg},bg=blue,bold] {name} "
  #
  #                 tab_normal              "{name} "
  #                 tab_normal_fullscreen   "{name} #{bold}* "
  #                 tab_normal_sync         "{name} <> "
  #
  #                 tab_active              "#[bg=green,fg=black,bold] {name} "
  #                 tab_active_fullscreen   "#[bg=green,fg=black,bold] {name} *"
  #                 tab_active_sync         "#[bg=green,fg=black,bold] {name} <> "
  #             }
  #         }
  #         pane
  #     }
  #   '';
  #   target = "zellij/layouts/default.kdl";
  # };
}
