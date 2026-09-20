{ pkgs, ... }:

{
  programs.helix.enable = true;

  stylix.targets.helix = {
    enable = true;
    colors.enable = false;
    opacity.enable = true;
  };
}
