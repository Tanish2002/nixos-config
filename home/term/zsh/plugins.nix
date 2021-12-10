{ pkgs, ... }:
{
  programs.zsh = {
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    plugins = with pkgs; [
    #Better Tab Completion
      {
        name = "fzf-tab";
        src = fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "50ed8af811329cd6379fc30e5f84b332da876f53";
          sha256 = "u/xZ3omMEXinXkEtEGjRuzA8wu6pb5CnEUq3in4ZJuQ=";
        };
      }
      #History Search
      {
        name = "zsh-history-substring-search";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-history-substring-search";
          rev = "4abed97b6e67eb5590b39bcd59080aa23192f25d";
          sha256 = "8kiPBtgsjRDqLWt0xGJ6vBBLqCWEIyFpYfd+s1prHWk=";
        };
        file = "zsh-history-substring-search.zsh";
      }
      #Prompt
      {
        name = "powerlevel10k";
        src = fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "3380f7503e7dc252163d5b30475335ed67f58a98";
          sha256 = "wlV+2+hXwNEDDucaHy06AqdPGFDxy5xlhHi8rvCxmbc=";
        };
        file = "powerlevel10k.zsh-theme";
      }
      # Sane Defaults
      {
        name = "zimfw-input";
        src = fetchFromGitHub {
          owner = "zimfw";
          repo = "input";
          rev = "cd90ab172366f73ce7efbaa69acd587c350bd03d";
          sha256 = "4BtU7d2hJi2L7r+6wdmDddPi5459yEZyZiZJeKAfFfw=";
        };
        file = "init.zsh";
      }
    ];
  };
}
