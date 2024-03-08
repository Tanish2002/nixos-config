{
  pkgs,
  inputs,
  ...
}: let
  resurrectDirPath = "~/.config/tmux/resurrect";
  popupTmux = pkgs.writeShellScript "popupTmux" ''
    width=''${2:-80%}
    height=''${2:-80%}
    if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ];then
        tmux detach-client
    else
        tmux popup -d '#{pane_current_path}' -xC -yC -w$width -h$height -E "tmux attach -t popup || tmux new -s popup"
    fi
  '';
in {
  programs.zsh.initExtra = ''
    path+=('${pkgs.unstable.tmuxPlugins.t-smart-tmux-session-manager}/share/tmux-plugins/t-smart-tmux-session-manager/bin')
  '';
  programs.tmux = {
    package = pkgs.unstable.tmux;
    enable = true;
    prefix = "C-a";
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 1000000;
    disableConfirmationPrompt = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    extraConfig = ''
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      set -g status-position top       # macOS / darwin style
      set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
      set -g @fzf-url-history-limit '2000'
      set -g status-bg '#181825'
      set-option -g set-titles on
      set-option -g set-titles-string "#T"
      bind-key -n "C-\\" run-shell '${popupTmux}'
    '';
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = tmux-thumbs;
        extraConfig = ''
          set -g @thumbs-command 'echo -n {} | xclip -sel copy'
        '';
      }
      tmux-fzf
      fzf-tmux-url
      {
        plugin = pkgs.unstable.tmuxPlugins.t-smart-tmux-session-manager;
        extraConfig = ''
          set -g @t-fzf-prompt '  '
          set -g @t-bind "o"
        '';
      }
      {
        plugin = tilish;
        extraConfig = ''
          bind -n "M-r" command-prompt -p 'Session name:' 'rename-session "%%"'
          set -g @tilish-navigator 'on'
        '';
      }
      {
        plugin = mkTmuxPlugin {
          pluginName = "catppuccin";
          version = "unstable-2018-12-02";
          src = inputs.tmux-catppuccin;
        };
        extraConfig = ''
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_middle_separator " | "

          set -g @catppuccin_window_default_fill "none"

          set -g @catppuccin_window_current_fill "all"

          set -g @catppuccin_status_modules_right "application session user host date_time"
          set -g @catppuccin_status_left_separator "█"
          set -g @catppuccin_status_right_separator "█"

          set -g @catppuccin_date_time_text "%Y-%m-%d %H:%M:%S"
        '';
      }
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-capture-pane-contents 'on'

          set -g @resurrect-dir ${resurrectDirPath}
          set -g @resurrect-hook-post-save-all 'target=$(readlink -f ${resurrectDirPath}/last); sed "s| --cmd .*-vim-pack-dir||g; s|/nix/store/[^ ]*/bin/||g" $target | ${pkgs.moreutils}/bin/sponge $target'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
          set -g @continuum-systemd-start-cmd 'start-server'
        '';
      }
    ];
  };
}
