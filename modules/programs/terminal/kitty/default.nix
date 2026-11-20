{ ... }:
let
  twilight = import ../../../themes/duskwire/palette.nix;
in
{
  home-manager.sharedModules = [
    (_: {
      programs.kitty = {
        enable = true;
        font = {
          size = 12.0;
          name = "monospace";
        };
        settings = {
          background = twilight.base;
          foreground = twilight.text;
          cursor = twilight.pink;
          cursor_text_color = twilight.crust;
          selection_foreground = twilight.text;
          selection_background = twilight.surface2;
          url_color = twilight.blue;
          color0 = twilight.crust;
          color1 = twilight.red;
          color2 = twilight.green;
          color3 = twilight.yellow;
          color4 = twilight.blue;
          color5 = twilight.mauve;
          color6 = twilight.teal;
          color7 = twilight.subtext1;
          color8 = twilight.overlay0;
          color9 = twilight.maroon;
          color10 = twilight.green;
          color11 = twilight.peach;
          color12 = twilight.lavender;
          color13 = twilight.pink;
          color14 = twilight.sky;
          color15 = twilight.text;

          # shell = "${getExe pkgs.tmux}";
          # cursor_trail = 3; # Fancy cursor movements (especially in nixvim)
          # cursor_trail_decay = "0.08 0.3"; # Animation speed
          # cursor_trail_start_threshold = "4";
          strip_trailing_spaces = "smart";
          macos_option_as_alt = "yes";
          macos_quit_when_last_window_closed = true;
          copy_on_select = "yes";
          confirm_os_window_close = 0;
          scrollback_lines = 10000;
          enable_audio_bell = false;
          mouse_hide_wait = 60;
          update_check_interval = 0;

          ## Tabs
          tab_title_template = "{index}";
          active_tab_font_style = "normal";
          inactive_tab_font_style = "normal";
          tab_bar_style = "powerline";
          tab_powerline_style = "round";
          active_tab_foreground = twilight.crust;
          active_tab_background = twilight.mauve;
          inactive_tab_foreground = twilight.subtext1;
          inactive_tab_background = twilight.surface0;
        };
        # shellIntegration.mode = "no-sudo";
        keybindings = {
          "ctrl+alt+n" = "launch --cwd=current";
          "alt+w" = "copy_and_clear_or_interrupt";
          "ctrl+y" = "paste_from_clipboard";
          "alt+1" = "goto_tab 1";
          "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "alt+5" = "goto_tab 5";
          "alt+6" = "goto_tab 6";
          "alt+7" = "goto_tab 7";
          "alt+8" = "goto_tab 8";
          "alt+9" = "goto_tab 9";
          "alt+0" = "goto_tab 10";

          # Tmux
          "ctrl+t" = "launch --cwd=current --type=overlay tmux-sessionizer";
          # "ctrl+t" = "launch --cwd=current --title tmux-sessionizer tmux-sessionizer";
          "ctrl+shift+left" = "no_op";
          "ctrl+shift+right" = "no_op";
        };
      };
    })
  ];
}
