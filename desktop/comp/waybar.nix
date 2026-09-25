{ ... }:

{
  programs.waybar = {
    enable = true;
      
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        margin-top = 2;
        margin-left = 4;
        margin-right = 4;

        height = 20;

        modules-left = [ "hyprland/workspaces" ];        
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "battery" ];

        "hyprland/workspaces" = {
          format = "{name}";
          persistent-workspaces = {
            "*" = 5;
          };
        };
      };
    };

    style = ''
        * {
          all: unset;
        }
        
        window#waybar, #workspaces button, #clock, #pulseaudio, #battery {
          border-radius: 2px;
          padding-left: 5px;
          padding-right: 5px;
          margin: 0 5px;
          background-color: transparent;
        }       

        #workspaces button.active {
          color: #FFFFFF;
        }

        #workspaces button {
          color: #696969;
        }

        #battery {
          color: #696969;
        }

        #battery.charging, #battery.plugged {
          color: #FFFFFF;
        }
      '';
  };
}
