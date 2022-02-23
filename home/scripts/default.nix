{ pkgs, inputs, ... }: {
  home = {
    packages = with pkgs; [ file maim libnotify cpufrequtils];
    file.bin = { source = inputs.bin; };
  };
}
