{ pkgs, misc, ... }: {
  # This file will never be modified by fleek
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors
  programs.zsh = {
    enableAutosuggestions = true;
    completionInit =
      ''
        autoload -Uz compinit && compinit
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      ''
    ;

    enableSyntaxHighlighting = true;

  };
}
