{ ... }:

{
  programs.waybar = {
    enable = true;
      
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        height = 20;

        modules-left = [ "hyprland/workspaces" ];        
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "battery" ];
      };
    };
  };
}
