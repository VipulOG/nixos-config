{ pkgs, username, home-manager, ... }: {
  home-manager.users.${username} = { lib, config, ... }: {
    programs.git = {
      enable = true;

      userName = "VipulOG";
      userEmail = "90324465+VipulOG@users.noreply.github.com";

      extraConfig = {
        init.defaultBranch = "main";
        trim.bases = "develop,master,main"; # for git-trim
        push.autoSetupRemote = true;
        pull.rebase = true;

        # replace https with ssh
        url = {
          "ssh://git@github.com/vipulog" = {
            insteadOf = "https://github.com/vipulog";
          };
        };
      };

      # A syntax-highlighting pager in Rust(2019 ~ Now)
      delta = {
        enable = true;
        options = {
          diff-so-fancy = true;
          line-numbers = true;
          true-color = "always";
        };
      };

      aliases = {
        ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
        ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";

        amend = "commit --amend"; # amend commit via `git amend`
        unstage = "reset HEAD --"; # unstage file via `git unstage <file>`
        merged = "branch --merged"; # list merged(into HEAD) branches via `git merged`
        unmerged = "branch --no-merged"; # list unmerged(into HEAD) branches via `git unmerged`
        nonexist = "remote prune origin --dry-run"; # list non-exist(remote) branches via `git nonexist`

        # delete merged branches except master & dev & staging
        #  `!` indicates it's a shell script, not a git subcommand
        delmerged = ''! git branch --merged | egrep -v "(^\*|main|master|dev|staging)" | xargs git branch -d'';
        # delete non-exist(remote) branches
        delnonexist = "remote prune origin";

        # aliases for submodule
        update = "submodule update --init --recursive";
        foreach = "submodule foreach";
      };
    };

    home.packages = with pkgs; [ git-trim ];

    # `programs.git` will generate the config file: ~/.config/git/config
    # to make git use this config file, `~/.gitconfig` should not exist!
    #
    # https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
    home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
      rm -f ${config.home.homeDirectory}/.gitconfig
    '';
  };
}
