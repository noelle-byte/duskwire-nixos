{ pkgs, ... }:
let
  twilight = import ../../../../themes/duskwire/palette.nix;
  gamemode = pkgs.callPackage ../../scripts/gamemode.nix { };
  togglepowermode = pkgs.callPackage ../../scripts/togglepowermode.nix { };
in
{
  #  use later
  home-manager.sharedModules = [
    (_: {
      services.swaync = {
        enable = true;
        settings = {
          "$schema" = "/etc/xdg/swaync/configSchema.json";
          positionX = "right";
          positionY = "top";
          cssPriority = "user";
          control-center-margin-top = 10;
          control-center-margin-bottom = 10;
          control-center-margin-right = 10;
          control-center-margin-left = 0;
          notification-icon-size = 64;
          notification-body-image-height = 100;
          notification-body-image-width = 200;
          timeout = 6;
          timeout-low = 3;
          timeout-critical = 0;
          fit-to-screen = false;
          control-center-width = 400;
          control-center-height = 940;
          notification-window-width = 375;
          keyboard-shortcuts = true;
          image-visibility = "when-available";
          transition-time = 200;
          hide-on-clear = false;
          hide-on-action = true;
          script-fail-notify = true;
          widgets = [
            "title"
            "dnd"
            "menubar#desktop"
            "volume"
            "mpris"
            "notifications"
            "buttons-grid"
          ];
          widget-config = {
            title = {
              text = " Quick settings";
              clear-all-button = true;
              button-text = "";
            };
            "menubar#desktop" = {
              "backlight" = {
                label = "       󰃟  ";
              };
              "menu#screenshot" = {
                label = "󰄀  Screenshot";
                position = "left";
                actions = [
                  {
                    label = "Whole screen";
                    command = "sh -c 'swaync-client -cp; sleep 1; ${pkgs.grimblast}/bin/grimblast copysave output \"/tmp/screenshot.png\"; ${pkgs.swappy}/bin/swappy -f \"/tmp/screenshot.png\"'";
                  }
                  {
                    label = "Whole window / Select region";
                    command = "sh -c 'swaync-client -cp; ${pkgs.grimblast}/bin/grimblast copysave area \"/tmp/screenshot.png\"; ${pkgs.swappy}/bin/swappy -f \"/tmp/screenshot.png\"'";
                  }
                ];
              };
              "menu#power" = {
                label = "  Power Menu";
                position = "left";
                actions = [
                  {
                    label = "  Shut down";
                    command = "systemctl poweroff";
                  }
                  {
                    label = "  Reboot";
                    command = "systemctl reboot";
                  }
                  {
                    label = "󰤄  Suspend";
                    command = "systemctl suspend";
                  }
                  {
                    label = "  Logout";
                    command = "hyprctl dispatch exit 0";
                  }
                  {
                    label = "  Lock";
                    command = "hyprlock";
                  }
                ];
              };
            };
            volume = {
              label = "";
              expand-button-label = "";
              collapse-button-label = "";
              show-per-app = true;
              show-per-app-icon = true;
              show-per-app-label = true;
            };
            dnd = {
              text = " Do Not Disturb";
            };
            mpris = {
              image-size = 96;
              image-radius = 4;
            };
            notifications = {
              text = "Notifications";
              clear-all-button = true;
              button-text = " Clear";
            };

            "buttons-grid" = {
              actions = [
                {
                  label = "󰝟";
                  type = "toggle";
                  command = "${pkgs.pamixer}/bin/pamixer -t";
                  update-command = "sh -c '${pkgs.pamixer}/bin/pamixer --get-mute | grep -q true && echo true || echo false'";
                }
                {
                  label = "󰍭";
                  type = "toggle";
                  command = "${pkgs.pamixer}/bin/pamixer --default-source -t";
                  update-command = "sh -c '${pkgs.pamixer}/bin/pamixer --get-mute --default-source | grep true && echo true || echo false'";
                }

                {
                  label = "";
                  type = "toggle";
                  command = "blueman-manager";
                  update-command = "sh -c 'bluetoothctl show | grep -q \\\"Powered: yes\\\" && echo true || echo false'";
                }

                {
                  label = "󰤨";
                  type = "toggle";
                  command = "sh -c '[ \"$SWAYNC_TOGGLE_STATE\" = true ] && nmcli radio wifi on || nmcli radio wifi off'";
                  update-command = "sh -c 'nmcli radio wifi | grep -q enabled && echo true || echo false'";
                }

                {
                  label = "🎮";
                  type = "toggle";
                  command = "${gamemode}/bin/gamemode";
                  update-command = "hyprctl getoption animations:enabled | grep -q 'int: 1' && echo false || echo true";
                }

                {
                  label = "󰤄";
                  type = "toggle";
                  command = "sh -c '${pkgs.procps}/bin/pgrep -x hyprsunset >/dev/null && ${pkgs.procps}/bin/pkill hyprsunset || nohup ${pkgs.hyprsunset}/bin/hyprsunset --temperature 3500 > /tmp/hyprsunset_output.log 2>&1 &'";
                  update-command = "sh -c 'pgrep -x hyprsunset >/dev/null && echo true || echo false'";
                }

                {
                  label = "☕";
                  command = "systemctl --user is-active --quiet hypridle.service && systemctl --user stop hypridle.service || systemctl --user start hypridle.service";
                  type = "toggle";
                  update-command = "pgrep -x hypridle > /dev/null && echo false || echo true";
                }

                {
                  label = "";
                  type = "toggle";

                  command = "${togglepowermode}/bin/togglepowermode";
                  update-command = "test -f \"$HOME/.config/hypr/power_mode\" && grep -q \"^powersave$\" \"$HOME/.config/hypr/power_mode\" && echo true || echo false";
                }
              ];
            };
          };
          scripts = {
            example-script = {
              exec = "echo 'Do something...'";
              urgency = "Normal";
            };
          };
          notification-visibility = {
            spotify = {
              state = "enabled";
              urgency = "Low";
              app-name = "Spotify";
            };
            youtube-music = {
              state = "enabled";
              urgency = "Low";
              app-name = "com.github.th_ch.youtube_music";
            };
          };
        };
        style = ''
          @define-color shadow rgba(0, 0, 0, 0.25);
          @define-color base   ${twilight.base};
          @define-color mantle ${twilight.mantle};
          @define-color crust  ${twilight.crust};

          @define-color text     ${twilight.text};
          @define-color subtext0 ${twilight.subtext0};
          @define-color subtext1 ${twilight.subtext1};

          @define-color surface0 ${twilight.surface0};
          @define-color surface1 ${twilight.surface1};
          @define-color surface2 ${twilight.surface2};

          @define-color overlay0 ${twilight.overlay0};
          @define-color overlay1 ${twilight.overlay1};
          @define-color overlay2 ${twilight.overlay2};

          @define-color blue      ${twilight.blue};
          @define-color lavender  ${twilight.lavender};
          @define-color sapphire  ${twilight.sapphire};
          @define-color sky       ${twilight.sky};
          @define-color teal      ${twilight.teal};
          @define-color green     ${twilight.green};
          @define-color yellow    ${twilight.yellow};
          @define-color peach     ${twilight.peach};
          @define-color maroon    ${twilight.maroon};
          @define-color red       ${twilight.red};
          @define-color mauve     ${twilight.mauve};
          @define-color pink      ${twilight.pink};
          @define-color flamingo  ${twilight.flamingo};
          @define-color rosewater ${twilight.rosewater};

          @define-color base_lighter  ${twilight.base};
          @define-color mauve_lighter ${twilight.mauve};

          * {
            font-family: "JetBrainsMono NFM SemiBold", monospace;
            border-radius: 8px;
          }

          .notification {
            background: @base;
            border: 1px solid @surface2;
            border-radius: 8px;
            margin: 6px 0;
          }

          .notification-action {
            border: 2px solid;
            border-top: none;
          }

          .close-button {
            background: transparent;
            color: transparent;
          }

          /*** Notification ***/
          /* Notification header */
          .summary {
            color: @text;
            font-size: 16px;
            background: transparent;
            text-shadow: none;
            font-size: 16px;
          }

          .time {
            color: @subtext0;
            /* color: alpha(@text, 0.9); */
            font-size: 16px;
            background: transparent;
            font-size: 16px;
            text-shadow: none;
            margin-right: 18px;
          }

          .body {
            background: transparent;
            font-size: 15px;
            font-weight: 500;
            color: @subtext1;
            /* color: alpha(@text, 0.9); */
            text-shadow: none;
          }

          /* The "Notifications" and "Do Not Disturb" text widget */
          .top-action-title {
            color: @text;
            /* color: @text; */
            text-shadow: none;
          }

          .control-center {
            background: alpha(@base, .80);
            border-radius: 8px;
            border: 1px solid @surface2;
          }

          .control-center .notification-row:focus,
          .control-center .notification-row:hover {
            opacity: 1;
            border-radius: 8px;
          }

          .notification-row {
            outline: none;
            margin: 0;
            padding: 0;
            background: transparent;
            border: none;
            /* background: alpha(@mantle, .80); */
          }

          .notification-group {
            background: transparent;
            border: none;
          }

          /*** Widgets ***/

          /* Title widget */
          .widget-title {
            margin: 0px;
            background: transparent;
            /* background: @base; */
            border-radius: 4px 4px 0px 0px;
            /* border: 1px solid @surface1; */
            border-radius: 8px;
            border-bottom: none;
          }

          .widget-title > label {
            margin: 18px 10px;
            font-size: 20px;
            font-weight: 500;
          }

          .widget-title > button {
            font-weight: 700;
            padding: 7px 3px;
            margin-right: 10px;
            background: transparent;
            color: @text;
            /* color: @text; */
            border: none;
            /* border: none; */
            border-radius: 4px;
          }
          .widget-title > button:hover {
            background: @base;
            /* background: alpha(currentColor, 0.1); */
          }

          /* Label widget */
          .widget-label {
            margin: 0px;
            padding: 0px;
            min-height: 5px;
            background: alpha(@base, .80);
            /* background: @base; */
            border-radius: 0px 0px 4px 4px;
            /* border: 1px solid @surface1; */
            border-top: none;
          }
          .widget-label > label {
            font-size: 15px;
            font-weight: 400;
          }

          /* Menubar */
          .widget-menubar {
            background: transparent;
            /* background: @base; */
            /* border: 1px solid @surface1; */
            border-radius: 4px;
            border-top: none;
            border-bottom: none;
          }
          .widget-menubar > box > box {
            margin: 5px 5px 5px 5px;
            min-height: 40px;
            border-radius: 4px;
            background: transparent;
          }
          .widget-menubar > box > box > button {
            background: alpha(@base, .80);
            /* background: alpha(currentColor, 0.05); */
            min-width: 185px;
            min-height: 50px;
            margin-right: 25px;
            font-size: 14px;
            padding: 5px;
          }
          .widget-menubar > box > box > button:nth-child(2) {
            margin-right: 0px;
            padding-top: 5px;
          }
          .widget-menubar button:hover {
            background: @surface2;
            /* background: alpha(currentColor,0.1); */
            box-shadow: none;
          }

          .widget-menubar > box > revealer > box {
            margin: 5px 10px 5px 10px;
            background: alpha(@base, .80);
            /* background: alpha(currentColor, 0.05); */
            border-radius: 4px;
          }
          .widget-menubar > box > revealer > box > button {
            background: transparent;
            min-height: 50px;
            padding: 0px;
            margin: 5px;
          }

          /* Buttons grid */
          .widget-buttons-grid {
            /* background-color: @base; */
            background: transparent;
            /* border: 1px solid @surface1; */
            border-top: none;
            border-bottom: none;
            font-size: 14px;
            font-weight: 500;
            margin: 0px;
            padding: 0px;
            border-radius: 0px;
          }

          .widget-buttons-grid > flowbox > flowboxchild {
            background: @base;
            /* background: alpha(currentColor, 0.05); */
            border-radius: 4px;
            min-height: 40px;
            min-width: 85px;
            margin: 5px;
            padding: 0px;
          }

          .widget-buttons-grid > flowbox > flowboxchild > button {
            background: transparent;
            border-radius: 4px;
            margin: 0px;
            border: none;
            box-shadow: none;
          }


          .widget-buttons-grid > flowbox > flowboxchild > button:hover {
            background: @surface2;
            /* background: alpha(currentColor, 0.1); */
          }

          /* Mpris widget */
          .widget-mpris {
            padding: 8px;
            border-radius: 8px;
            padding-bottom: 15px;
            margin-bottom: 0px;
          }
          .widget-mpris > box > button,
          .widget-mpris-player,
          .widget-mpris-album-art, {
            box-shadow: none;
            margin: 10px 0 0 0;
            padding: 5px 10px;
            border-radius: 8px;
          }

          /* Backlight and volume widgets */
          .widget-backlight,
          .widget-volume {
            background: transparent;
            /* background-color: @base; */
            border-top: none;
            border-bottom: none;
            font-size: 13px;
            font-weight: 600;
            border-radius: 0px;
            margin: 0px;
            padding: 0px;
          }
          .widget-volume > box {
            background: alpha(@base, .80);
            /* background: alpha(currentColor, 0.05); */
            border-radius: 4px;
            margin: 5px 10px 5px 10px;
            min-height: 50px;
          }
          .widget-volume > box > label {
            min-width: 50px;
            padding: 0px;
          }
          .widget-volume > box > button {
            min-width: 50px;
            box-shadow: none;
            padding: 0px;
          }
          .widget-volume > box > button:hover {
            /* background: alpha(currentColor, 0.05); */
            background: @surface0;
          }
          .widget-volume > revealer > list {
            background: alpha(@base, .80);
            /* background: alpha(currentColor, 0.05); */
            border-radius: 4px;
            margin-top: 5px;
            padding: 0px;
          }
          .widget-volume > revealer > list > row {
            padding-left: 10px;
            min-height: 40px;
            background: transparent;
          }
          .widget-volume > revealer > list > row:hover {
            background: transparent;
            box-shadow: none;
            border-radius: 4px;
          }
          .widget-backlight > scale {
            background: alpha(@base, .80);
            /* background: alpha(currentColor, 0.05); */
            border-radius: 0px 4px 4px 0px;
            margin: 5px 10px 5px 0px;
            padding: 0px 10px 0px 0px;
            min-height: 50px;
          }
          .widget-backlight > label {
            background: @surface0;
            /* background: alpha(currentColor, 0.05); */
            margin: 5px 0px 5px 10px;
            border-radius: 4px 0px 0px 4px;
            padding: 0px;
            min-height: 50px;
            min-width: 50px;
          }

          /* DND widget */
          .widget-dnd {
            margin: 6px 10px;
            padding: 0 12px;
            font-size: 1.2rem;
          }

          .widget-dnd > switch {
            background: alpha(@base, .80);
            font-size: initial;
            border-radius: 8px;
            box-shadow: none;
            padding: 2px;
          }

          .widget-dnd > switch:hover {
            background: alpha(@surface2, .80);
          }

          .widget-dnd > switch:checked {
            background: @text;
          }

          .widget-dnd > switch:checked:hover {
            background: alpha(@text, .80);
          }

          .widget-dnd > switch slider {
            background: alpha(@surface2, .80);
            border-radius: 6px;
          }

          /* Toggles */
          .toggle:checked {
            background: @surface1;
            /* background: @surface2; */
          }
          /*.toggle:not(:checked) {
            color: rgba(128, 128, 128, 0.5);
          }*/
          .toggle:checked:hover {
            background: @surface2;
            /* background: alpha(@surface2, 0.75); */
          }

          scale trough {
            border-radius: 4px;
            background: @surface0;
            /* background: alpha(currentColor, 0.1); */
          }

          scale slider {
            background: @text;
          }
          scale slider:hover {
          }

          /* Hide scrollbars */
          scrollbar,
          scrollbar * {
            all: unset;
            min-width: 0px;
            min-height: 0px;
          }

          scrollbar slider {
            background: transparent;
          }

          scrollbar.vertical,
          scrollbar.horizontal {
            background: transparent;
          }
        '';
      };
    })
  ];
}
