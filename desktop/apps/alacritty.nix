{ lib, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        blur = true;
      };
    };
  };
}
