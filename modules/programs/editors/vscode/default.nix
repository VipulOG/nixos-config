{ pkgs, lib, home-manager, username, ... }: {
  home-manager.users.${username} = {
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;

      # Extensions
      extensions = (with pkgs.vscode-extensions; [
        # Unstable
        ms-vscode-remote.remote-ssh
        mhutchie.git-graph
        donjayamanne.githistory
        eamodio.gitlens
        esbenp.prettier-vscode
        pkief.material-icon-theme
        ms-azuretools.vscode-docker
        oderwat.indent-rainbow
        bierner.markdown-emoji
        bierner.emojisense
        jnoortheen.nix-ide
        ritwickdey.liveserver
        streetsidesoftware.code-spell-checker
        gruntfuggly.todo-tree
        vscodevim.vim
        github.codespaces
        visualstudioexptteam.vscodeintellicode
        aaron-bond.better-comments
        seatonjiang.gitmoji-vscode
        ms-vscode-remote.remote-containers
      ]);

      # Settings
      userSettings = {
        # General
        "editor.fontSize" = 16;
        "editor.fontFamily" = lib.mkForce "'Jetbrains Mono', 'monospace', monospace";
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.fontFamily" = lib.mkForce "'JetBrainsMono Nerd Font', 'monospace', monospace";
        "window.zoomLevel" = 1;
        "editor.multiCursorModifier" = "ctrlCmd";
        "workbench.startupEditor" = "none";
        "explorer.compactFolders" = false;

        # Whitespace
        "files.trimTrailingWhitespace" = true;
        "files.trimFinalNewlines" = true;
        "files.insertFinalNewline" = true;
        "diffEditor.ignoreTrimWhitespace" = false;

        # Git
        "git.enableCommitSigning" = true;
        "git-graph.repository.sign.commits" = true;
        "git-graph.repository.sign.tags" = true;
        "git-graph.repository.commits.showSignatureStatus" = true;

        # Styling
        "window.autoDetectColorScheme" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.sideBar.location" = "right";
        "workbench.activityBar.location" = "bottom";
        "window.menuBarVisibility" = "hidden";
        "window.titleBarStyle" = "native";
        "window.customTitleBarVisibility" = "auto";
        "scm.showOutgoingChanges" = "never";

        # Vim
        "vim.useSystemClipboard" = true;

        # Other
        "telemetry.telemetryLevel" = "off";
        "update.showReleaseNotes" = false;
        "redhat.telemetry.enabled" = false;
      };
    };
  };
}
