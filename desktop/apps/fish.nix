{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
        set -g fish_greeting ""
      '';

    shellAbbrevs = {
      nrb = "sudo nixos-rebuild switch --flake .";
    };
  };
}
