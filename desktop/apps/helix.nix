{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    settings = {
      theme = "trans"; # (parent)

      editor = {
        line-number = "relative";
      };
    };

    themes = {
      trans = {
        "inherits" = "onedark";
        "ui.background" = { fg = ""; bg = ""; };
      };
    };
  };
}
