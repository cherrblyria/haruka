{ pkgs, config, ... }:
{
  programs = {
    # TUI
    btop.enable = true;
    cava = {
      enable = true;
      settings.color.theme = "noctalia";
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };

    # CLI
    fastfetch.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
    };
    git = {
      enable = true;
      signing = {
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
        signByDefault = true;
        format = "ssh";
      };
      settings = {
        user = {
          name = "cherrblyria";
          email = "cherrblyria@gmail.com";
        };
      };
    };

    # Shell
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        fastfetch
      '';
      functions = {
        yc = ''
          set -l tmp (mktemp -t "yazi-chooser.XXXXXX")
          command yazi $argv --chooser-file="$tmp"
          if test -s "$tmp"
            echo (cat "$tmp")
            rm -f -- "$tmp"
          end
        '';
      };
      shellAliases = {
        # Zoxide
        cd = "z";

        # Eza
        ls = "eza -h  --icons --group-directories-first";
        la = "ls -A";
        l = "ls -lA";
        ll = "ls -l";
        lls = "ls -lA --total-size";
        lt = "ls -T";
        lat = "ls -TA";

        # Shortcuts
        c = "clear";
        cls = "clear && fastfetch";

        # Programs
        f = "fzf";
        g = "git";
        lg = "lazygit";

        # File management
        mk = "touch";
        tch = "touch";
        mkd = "mkdir";
        mkdir = "mkdir -pv";
        cp = "cp -i";
        mv = "mv -i";
        rm = "rm -i";

        grep = "grep --color=auto";
        rg = "rg --color=always";
      };
      shellAbbrs = {
        def = "find . -type f -empty -delete";
        ded = "find . -type d -empty -delete";
        dbl = "find . -xtype l -delete";

        fef = "find . -type f -empty";
        fed = "find . -type d -empty";
        fbl = "find . -xtype l";
      };
    };

    # Desktop Apps
    obsidian = {
      enable = true;
      cli.enable = true;
      package = pkgs.obsidian.override {
        commandLineArgs = "--password-store=gnome-libsecret";
      };
    };
    vscode = {
      enable = true;
      mutableExtensionsDir = true;
    };
    kitty = {
      enable = true;
      font = {
        name = "CaskaydiaCove Nerd Font";
        size = 12;
      };
      settings = {
        force_ltr = "yes";

        cursor_shape = "block";
        cursor_shape_unfocused = "hollow";
        cursor_blink_interval = "-1";
        cursor_trail = "1";
        cursor_trail_decay = "0.1 0.4";
        cursor_trail_start_threshold = "2";

        scrollback_lines = "2000";

        remember_window_size = "yes";
        initial_window_width = "640";
        initial_window_height = "400";

        window_margin_width = "0";
        window_padding_width = "0 16";
        hide_window_decorations = "yes";
        resize_in_steps = "no";
        confirm_os_window_close = "0";

        background_opacity = "1.0";
        background_blur = "0";

        include = "${config.home.homeDirectory}/.config/kitty/themes/noctalia.conf";
      };
      enableGitIntegration = true;
      shellIntegration.enableFishIntegration = true;
    };
  };
}
