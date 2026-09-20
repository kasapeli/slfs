{ config, pkgs, lib, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";

  home.stateVersion = "26.11";

  home.packages = with pkgs; [
    git
    helix
    fastfetch
  ];

  imports = [
    ./desktop/dman.nix
    ./dev/git.nix
  ];

  programs.home-manager.enable = true;
}
