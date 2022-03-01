{ pkgs, inputs, ... }: {
  nixpkgs.overlays =
    [ (final: prev: { scripts = inputs.bin.defaultPackage.x86_64-linux; }) ];
  home = {
    packages = with pkgs; [ scripts ];
    
    # Link the scripts to home
    file.bin.source = "${inputs.bin}/scripts";
  };
}
