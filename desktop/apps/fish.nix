{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
        set -g fish_greeting ""
      '';

    shellAbbrs = {
      nrb = "sudo nixos-rebuild switch --flake .";
    };
  };

  stylix.targets.fish.enable = false;
}
