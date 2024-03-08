_: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      #using github.com so it's default and easier to just copy paste
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${./keys/personal/key}";
        identitiesOnly = true;
      };
      "work" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${./keys/work/key}";
        identitiesOnly = true;
      };
      "home" = {
        hostname = "100.93.231.44";
        user = "snoopy";
        identityFile = "${./keys/personal/key}";
        identitiesOnly = true;
        port = 69;
      };
    };
  };
}
