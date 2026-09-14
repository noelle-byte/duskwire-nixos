{ host, pkgs, ... }:

let
  # Temporary GTK/Qt substrate.
  # We can replace this later with a fully custom Twilight theme.
  variant = "mocha";
  accent = "red";

  kvantumPkg = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };

  kvantumTheme = "catppuccin-${variant}-${accent}";
in
{
  home-manager.sharedModules = [
    (
      { config, ... }:
      {
        home.packages = [
          kvantumPkg
        ];

        qt = {
          enable = true;
          platformTheme.name = "gtk3";
          style.name = "kvantum";
        };

        gtk = {
          enable = true;
          gtk2.force = true;

          theme = {
            name = "${kvantumTheme}-compact";
            package = pkgs.catppuccin-gtk.override {
              variant = variant;
              accents = [ accent ];
              size = "compact";
            };
          };

          iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
          };

          gtk3.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
          };

          gtk4.extraConfig = {
            "gtk-application-prefer-dark-theme" = "1";
          };
        };

        home.sessionVariables = {
          ADW_COLOR_SCHEME = "prefer-dark";
        };

        dconf.settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };

        xdg.configFile = {
          "gtk-4.0/assets" = {
            force = true;
            source =
              "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
          };

          "gtk-4.0/gtk.css" = {
            force = true;
            source =
              "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
          };

          "gtk-4.0/gtk-dark.css" = {
            force = true;
            source =
              "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
          };

          "Kvantum/${kvantumTheme}".source =
            "${kvantumPkg}/share/Kvantum/${kvantumTheme}";

          "Kvantum/kvantum.kvconfig".source =
            (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
              General.theme = kvantumTheme;
            };
        };
      }
    )
  ];
}
