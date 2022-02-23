{ pkgs, ... }: {
  xdg.configFile = {
    ranger = {
      source = ./config;
      recursive = true;
    };
    ranger_devicons = {
      source = pkgs.fetchFromGitHub {
        owner = "alexanderjeurissen";
        repo = "ranger_devicons";
        rev = "df583d66ed093849248c2cf1631bce15d01b30e1";
        sha256 = "XIJiBxAD4lwbTO9NzSF4szjtk+hp0dwZBpIdWxyk4vU=";
      };
      recursive = true;
      target = "ranger/plugins/ranger_devicons";
    };
  };
  home.packages = [ pkgs.ranger ]; 
}
