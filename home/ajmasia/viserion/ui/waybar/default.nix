{ config, pkgs, lib, ... }:

let
  palette = config.colorScheme.palette;
in
{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        modules-right = [ "idle_inhibitor" "pulseaudio" "disk" "cpu" "memory" "clock" "tray" ];
        modules-center = [ ];
        modules-left = [ ];

        # modules
        "tray" = {
          spacing = 12;
        };

        "clock" = {
          format = "{: %I:%M %p}";
          tooltip = false;
        };

        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip = true;
        };

        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };

        "disk" = {
          format = " {free}";
          tooltip = true;
        };

        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
          tooltip = "true";
        };
      }
    ];

    style = lib.concatStrings [
      ''
            * {
              font-size: 16px;
              font-family: Hack Nerd Font, Font Awesome, sans-serif;
              font-weight: bold;
            }

            window#waybar {
              background-color: rgba(26,27,38,0);
              border-bottom: 1px solid rgba(26,27,38,0);
              border-radius: 0px;
              color: #${palette.base0F};
            }

            #tray {
              color: #${palette.base05};
              background: #${palette.base01};
              margin: 4px;
              padding: 2px 10px;
              border-radius: 10px;
            }

            #clock {
        	    color: #${palette.base0B};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }

            #memory {
              color: #${palette.base0F};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }

            #disk {
              color: #${palette.base03};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }

            #cpu {
              color: #${palette.base07};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }

            #pulseaudio {
              color: #${palette.base0D};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }

            #idle_inhibitor {
              color: #${palette.base0A};
              background: #${palette.base00};
              border-radius: 15px 50px 15px 50px;
              margin: 5px;
              padding: 2px 20px;
            }
      ''
    ];
  };
}
