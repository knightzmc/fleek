{ config, pkgs, misc, ... }@inputs:
let
  cachedNixShell = pkgs.fetchFromGitHub {
    owner = "xzfc";
    repo = "cached-nix-shell";
    rev = "59b11bf82c409529410f066d6c2159fac9aa9aa7";
    sha256 = "sha256-sHsUsqGeAZW1OMbeqQdLqb7LgEvhzWM7jq17EU16K0A";
  };

  frameworks = pkgs.darwin.apple_sdk.frameworks;
in
{
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages

      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);

    };
    #overlays = [myOverlay];
  };


  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  home.packages = (with pkgs; [
    cachedNixShell
    discord
    rustup
    bash

    obsidian

    # NodeJS
    nodejs
    yarn
    nodePackages.pnpm

    # Haskell
    haskellPackages.hoogle
    haskellPackages.fast-tags


    cachix
    zsh-autosuggestions
    R
    gnupg
    nixpacks
    cairo
    nodePackages_latest.node-gyp
    pinentry_mac
    inetutils
    nil
    emacs
    nixpkgs-fmt
    kotlin-language-server
    pkg-config
    pixman
    python39
    spotify

    git
    htop
    github-cli
    glab
    fzf
    ripgrep
    vscode
    jq
    yq
    neofetch
    btop
    cheat
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ]);
  fonts.fontconfig.enable = true;
  home.stateVersion = "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
