{ config, pkgs, ... }:

{
  home.username = "branden";
  home.homeDirectory = "/home/branden";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    # CLIs
    git
    git-machete
    gh
    tmux
    zsh
    starship
    tree-sitter
    ripgrep

    neovim

    # Builds
    scala-cli
    nodejs_22
    jdk25
    maven

    # Language Servers
    nil
    emmylua-ls
    lombok
    jdt-language-server
    nil
    vtsls
    vue-language-server
    metals

    # Apps
    kitty
    slack
    firefox
    google-chrome

    # Music
    kew
    librespot
    spotify-qt

    # Fonts
    nerd-fonts.iosevka
  ];

  home.file = {};

  home.sessionVariables = with pkgs; {
    JDTLS_JVM_ARGS = "-javaagent:${lombok.outPath}/share/java/lombok.jar";
    JDTLS_PATH = "${jdt-language-server.outPath}/bin/jdtls";

    JAVA_HOME = "${jdk25.outPath}";

    BKT_CONFIG_DIR = "$HOME/.config/bkt";

    VUE_LS_PATH = "${vue-language-server}/lib/language-tools/packages/language-server";

  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {};

    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    profileExtra = ''
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 16;
    };
    themeFile = "Belafonte_Day";
  };
}
