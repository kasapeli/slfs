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
        hl.on("hyprland.start", function()
          hl.exec_cmd("waybar")
        end)

        local mainMod = "SUPER"

        hl.bind(mainMod .. " + Grave", hl.dsp.exec_cmd("alacritty"))
        hl.bind(mainMod .. " + Q", hl.dsp.window.close())
        hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
        hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("fuzzel"))

        for i = 1, 10 do
          local key = i % 10
          hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
          hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move ({workspace = i}))
        end
      '';
  };
}
