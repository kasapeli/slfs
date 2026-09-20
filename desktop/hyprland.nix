{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    waybar
    swaybg
    alacritty
  ];

  wayland.windowManager.hyprland = {
    # cant even config this in nix literally 1984 bro
    # billions must use sway
    enable = true;

    extraConfig = ''
        local mainMod = "SUPER"

        hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("alacritty"))
      '';
  };
}
