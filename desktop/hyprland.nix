{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    waybar
    alacritty
    wl-clipboard
    hyprshot
    hyprpicker
    awww
  ];

  wayland.windowManager.hyprland = {
    # cant even config this in nix literally 1984 bro
    # billions must use sway
    enable = true;

    extraConfig = ''
        hl.on("hyprland.start", function()
          hl.exec_cmd("waybar")
          hl.exec_cmd("awww-daemon")
        end)

        local mainMod = "SUPER"

        hl.bind(mainMod .. " + Grave", hl.dsp.exec_cmd("alacritty"))
        hl.bind(mainMod .. " + Q", hl.dsp.window.close())
        hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
        hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("fuzzel"))
        hl.bind("Print", hl.dsp.exec_cmd("hyprshot -zm region --clipboard-only"))
        hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

        hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
        hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

        for i = 1, 10 do
          local key = i % 10
          hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
          hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move ({workspace = i}))
        end

        hl.config({
          general = {
            border_size = 0,
          },

          decoration = {
            rounding = 5,
            rounding_power = 2,
            
            blur = {
              enabled = true,
              size = 10,
              passes = 4,

              new_optimizations = true,
              xray = true,
              noise = 0.02,
              brightness = 0.8,
              vibrancy = 0.2,
            }
          }
        })

        hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
        hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
        hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
    '';
  };
}
