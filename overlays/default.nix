{picom-git, ... }:
final: prev: {
  picom-src = prev.picom.overrideAttrs (o: {
    src = picom-git; 
  });
}
