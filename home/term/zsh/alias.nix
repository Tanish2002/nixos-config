{pkgs, ...}: {
  home.packages = [pkgs.cpufrequtils];
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
      xdisp = "DISPLAY=:1";
      waycord = "Discord --enable-features=UseOzonePlatform --ozone-platform=wayland";
      h = "history";
      p = "pwd -P";
      s = "sudo -s";
      vim = "nvim";
      rr = "lf";
      gameoff = "sudo cpufreq-set -g powersave";
      gameon = "sudo cpufreq-set -g performance";
    };
  };
}
