{ config, pkgs, ... }: {
  imports = [ ./plugins.nix ./alias.nix ];
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    sessionVariables = {
      PATH =
        "\${HOME}/.local/bin:$HOME/.emacs.d/bin:$HOME/.cabal/bin:\${PATH}";
      EDITOR = "nvim";
      VISUAL = "emacs";
      BROWSER = "firefox";
      LC_ALL = "en_US.UTF-8";
      HISTORY_SUBSTRING_SEARCH_PREFIXED = "1";
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      extended = true;
      save = 50000;
    };
    initExtra = ''
      #      eval "$(starship init zsh)"
            setopt NO_NOMATCH   # disable some globbing

            # If you come from bash you might have to change your $PATH.
            FORCE_UNSAFE_CONFIGURE=1

            # Ueberzug Fix for tabbed (https://github.com/seebye/ueberzug/issues/80)
            [ ! -z "$WINDOWID" ] && export UEBERZUG_USE_WINDOWID=1

            FZF_TAB_COMMAND=(
                ${pkgs.fzf}/bin/fzf
                --ansi
                --expect='$continuous_trigger' # For continuous completion
                '--color=hl:$(( $#headers == 0 ? 108 : 255 ))'
                --nth=2,3 --delimiter='\x00'  # Don't search prefix
                --layout=reverse --height="''${FZF_TMUX_HEIGHT:=50%}"
                --tiebreak=begin -m --bind=tab:down,btab:up,change:top,ctrl-space:toggle --cycle
                '--query=$query'   # $query will be expanded to query string at runtime.
                '--header-lines=$#headers' # $#headers will be expanded to lines of headers at runtime
            )
            zstyle ':fzf-tab:*' command $FZF_TAB_COMMAND 
            zstyle ':completion:complete:*:options' sort false
            zstyle ':fzf-tab:complete:_zlua:*' query-string input
            zstyle ':fzf-tab:complete:*:*' fzf-preview '/home/weeb/bin/preview.sh $realpath' # remember to use single quote here!!!
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
            
            #HISTORY CONFIG
            bindkey "$terminfo[kcuu1]" history-substring-search-up
            bindkey "$terminfo[kcud1]" history-substring-search-down
          '';
  };
}
