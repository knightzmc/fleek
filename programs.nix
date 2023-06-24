{ pkgs, misc, ... }: {
  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  # add your personalized program configuration in ./user.nix   

  # Bling supplied programs 
  programs.exa.enable = true;
  programs.bat.enable = true;
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  programs.direnv = {
    enable = true;

    nix-direnv = {
      enable = true;
    };
  };
  programs.starship.enable = true;

  # User specified programs 
  programs.helix.enable = false;
  programs.dircolors.enable = true;

  programs.vscode = {
    enable = true;
  };


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
    ];
  };

}
