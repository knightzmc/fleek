{pkgs, ...}: {
  home.packages = [pkgs.github-cli pkgs.git-crypt pkgs.gitkraken];
  programs.git = {
    userName = "Alexander Wood";
    enable = true;
    aliases = {
      ignore = "!gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}; gi";
    };
    extraConfig = {
      credential.helper =
        if pkgs.stdenvNoCC.isDarwin
        then "osxkeychain"
        else "cache --timeout=1000000000";
      commit.verbose = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      fetch.prune = true;
      http.sslVerify = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      push.followTags = true;
      push.autoSetupRemote = true;
    };
    aliases = {
      fix = "commit --amend --no-edit";
      oops = "reset HEAD~1";
      sub = "submodule update --init --recursive";
    };
    delta = {
      enable = false;
      options = {
        side-by-side = true;
        line-numbers = true;
      };
    };
    difftastic.enable = true;
    lfs.enable = true;
  };
}
