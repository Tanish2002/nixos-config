{ pkgs, ... }: {
  programs.zsh = {
    shellAliases = {
      ls = "ls --color=auto";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      cat = "bat --color always --plain";
      grep = "grep --color=auto";
      c = "clear";
      v = "nvim";
      xwin = "Xephyr -br -ac -noreset -screen 960x600 :1";
      xdisp = "DISPLAY=:1";
      waycord =
        "Discord --enable-features=UseOzonePlatform --ozone-platform=wayland";
      woogle-chrome =
        "google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland";
      h = "history";
      p = "pwd -P";
      s = "sudo -s";
      ff = "firefox";
      netprocs = "lsof -P -i -n";
      update = "sudo xbps-install -Svu";
      xr = "sudo xbps-remove";
      xi = "sudo xbps-install -S";
      xrs = "xbps-query -Rs";
      xq = "xbps-query -S";
      xpkg = "xbps-query -l";
      ed = "devour emacsclient --socket-name=/tmp/emacs1000/weeb-emacsd -c";
      ee = "devour emacs";
      vim = "nvim";
      weechat = "tmux new-session 'weechat'";
      pac = "sudo pacman -S";
      rr = "ranger";
      xres = "vim ~/.Xresources";
      zshrc = "vim $ZDOTDIR/.zshrc";
      i3config = "vim ~/.config/i3/config";
      polyconf = "vim ~/.config/polybar/config";
      dunstrc = "vim ~/.config/dunst/dunstrc";
      tint2rc = "vim ~/.config/tint2/tint2rc";
      stconf = "vim ~/pro/xst/src/config.h";
      playlists = "vim ~/.config/mpv/tubify_playlists";
      airlinevim =
        "vim ~/.config/nvim/plugged/vim-airline/autoload/airline/themes/dark.vim";
      quteconf = "vim ~/.config/qutebrowser/config.py";
      picomconf = "vim ~/.config/picom/picom.conf";
      gameoff = "sudo cpufreq-set -g powersave";
      gameon = "sudo cpufreq-set -g performance";
    };
  };
}
