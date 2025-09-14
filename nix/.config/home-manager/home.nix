{ config, pkgs, ... }:
with import <nixpkgs> { };
with builtins;
with lib;
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];
  # home-manager.users.clp = {
  # };
  home = {
    stateVersion = "25.05";
    packages = with pkgs; [
      unzip
      wget
      gnupg
      blackbox
      mc
      wpa_supplicant_gui
      udisks
      zathura
      htop
      ncdu
      ripgrep
      zeal
      gradle
      chromium
      firefox
      termite
      tmux
      gimp
      gcc
      vagrant
      plantuml
      nix-prefetch-git
      jq
      yq
      fx
      pandoc
      cabal-install
      gnumake
      brave
      cmake
      coreutils
      sway
      wofi
      grim
      waybar
      mako
      i3status
      i3blocks
      i3
      xclip
      notmuch
      isync
      python3
      msmtp
      msmtp-enqueue
      abook
      calcurse
      khal
      meli
      himalaya
      aerc
      alpine
      mutt
      micro
      rtv
      tuisky
      vlc
      emacs
      neomutt
      newsboat
      mise
      uv
      zig
      inkscape
      blender
      dotnet
      obs-studio
      vim
      helix
      kak-lsp
      neovim
      wasmtime
      binaryen
      ghc
      stack
      emscripten
      kakoune
    ];
  };
  programs = {
    home-manager = { enable = true; };
    dconf.enable = true;
    git = {
      enable = true;
      userName = "Chris Pecunies";
      userEmail = "chris@pecunies.com";

    };
    bash = {
      enable = true;
      bashrcExtra = "\n";
    };

  };
}
