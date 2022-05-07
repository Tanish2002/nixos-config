{ pkgs, ... }: {
  imports = [ ./zsh ./st ./foot ];
  home.packages = with pkgs; [ ripgrep fzf xclip ];
  programs = {
    bat = {
      enable = true;
      config = {
        theme = "GitHub";
        italic-text = "always";
        color = "always";
      };
    };
  };
}
