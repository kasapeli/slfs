{ ... }:

{
  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
        set -g fish_greeting ""
      '';

    shellAbbrs = {
      nrb = "sudo nixos-rebuild switch --flake .";
      rec-sys = "gpu-screen-recorder -w screen -f 60 -a (pactl get-default-sink).monitor -o ~/Videos/desktop_recording_(date +%Y-%m-%d_%H-%M-%S).mp4";
    };
  };
}
