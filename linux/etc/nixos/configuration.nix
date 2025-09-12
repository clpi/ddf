# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, callPackage, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # programs.steam.extraPackages = [pkgs.jdk];
  # programs.steam.gamescopeSession.enable = true;


  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  programs.sway.enable = true;
  # services.xserver.desktopManager.plasma6.enable = true;
  # programs.zsh.enable = true;
  programs.htop.enable = true;
  # services.desktopManager.plasma6.enable = true;
environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    # only needed for Sway
    XDG_CURRENT_DESKTOP = "sway"; 
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };
  programs.xwayland.enable = true;
  programs.waybar.enable = true;
  # programs.dbus.enable = true;
    xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  programs.sway.wrapperFeatures.gtk= true;

  programs.river.enable = true;
  programs.labwc.enable = true;
  programs.wayfire.enable = true;
  programs.hyprland.xwayland.enable = true;
  # programs.nushell.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  programs.hyprland.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs.zsh.enable=true;
  programs.fish.enable=true;
  programs.xonsh.enable=true;
  users.defaultUserShell = pkgs.fish;
  users.users.clp.shell = pkgs.fish;
  programs.i3lock.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "ZedMono Nerd Font" ];
  services.blueman.enable = true;
  # security.sudo.extraRules = [
  #   { users = [ "clp" ];
  #     commands = [
  #       { command = "ALL" ;
  #         options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
  #       }
  #     ];
  #  }
  #  ];

  # environment.shells = with pkgs; [
  #
  # zsh
  # fish
  # # nushell
  # ];
  programs.dconf.enable = true;
  programs.java = {
    enable = true;
    # package = pkgs.oraclejre8;
  };
  # Enable the X11 windowing system.
  security.polkit.enable = true;
  # services.desktopManager.plasma-desktop.enable = true;
  # services.desktopManager.sddm.enable = true;
  # services.desktopManager.sddm.wayland.enable = true;
  services.xserver = {
	  enable = true;
	  windowManager = {
	  	qtile.enable = true;
	  	i3 = {
			enable = true;
			extraPackages = with pkgs; [
				dmenu
				i3status
				i3blocks
			];
		};
		awesome = {
			enable = true;
			luaModules = with pkgs.luaPackages; [
			    luarocks
			    luadbi-mysql
			    awesome-wm-widgets
			    
			];
		};
		dwm.enable= true;
		openbox.enable= true;
		xmonad ={
		enable=true;
		enableContribAndExtras=true;
		};

	  };
	  displayManager.gdm.enable = true;
	  desktopManager={
	  	xterm.enable = false;
	  	gnome.enable = true;
	};
	  xkb = {
	    layout = "us";
	    variant = "";
	  };
  };
  programs.light.enable = true;

  # Enable the GNOME Desktop Environment.

  # Configure keymap in X11

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.emacs = {
  	enable = true;
	package = pkgs.emacs;
	};
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
	#  wayland.windowManager.hyprland = {
	#  	enable = true;
	# package = pkgs.hyprland;
	# xwayland.enable = true;
	# systemd.enable = true;
	#  };
  nix.settings.experimental-features = [
  "nix-command"
  "flakes"
  ];
  virtualisation= {
  	containers.enable = true;
	podman = {
	enable = true;
	dockerCompat = false;
	defaultNetwork.settings.dns_enabled = true;
	};
	oci-containers = {
		backend = "podman";
	};
  	docker = {
		enable = true;
		# daemon.settings = {
		# 	userland-proxy = false;
		# 	experimental = true;
		# 	ipv6 = true;
		# };
		# storageDriver= "btrfs";
		# rootless = {
			# enable = true;
			# setSocketVariable=true;
		# };
	};
};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clp = {
    isNormalUser = true;
    description = "Chris";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    kdePackages.kate
    # kdePackages.kile
    # kdePackages.krita
    kdePackages.discover
    kdePackages.kdevelop
    vlc
    kanshi
    swayidle
    wayland-utils
    wl-clipboard
    	vim
	grc
	neovim
	kakoune
	vis
	dive
	podman
	podman-tui
	docker-compose
	podman-compose
	podman-desktop
	gpg-tui
	ansible
	helix
	parinfer-rust
	thunderbird
	dotnet-runtime
	dotnet-sdk
	dotnet-repl
    ];
  };
  programs.git = {
	  enable = true;
	  # userName = "Chris Pecunies";
	  # userEmail = "chris@pecunies.com";
  };
  services.factorio = {
  	enable = true;
	openFirewall = true;
	};

  # Install firefox.
  programs.firefox.enable = true;
  programs.nix-ld.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  (wrapOBS {
  	plugins = with obs-studio-plugins; [
		wlrobs
		obs-backgroundremoval
		obs-pipewire-audio-capture
	];
  })
  kompose
  kubectl
  kubernetes
  	gnomeExtensions.appindicator
	factorio-headless
    fishPlugins.done
    fishPlugins.fzf-fish
    binutils
    gcc
    glib
    light
    swayidle
    diffutils
    diff-so-fancy
    fzy
    ripgrep
    google-cloud-sdk
    playerctl
    ranger
    kanshi
    wayland
    tmux
    libinput
    libxkbcommon
    zlib
    libnotify
    wlroots
    swaylock
    libva
    xorg.libxcb
    xorg.xcbutilwm
    glibc.static
    wdisplays
    fnott
    bemenu
    gimp
    spotify
    alacritty
    firefox-devedition
    # nix-prefetch-github
    pavucontrol
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    fish
    gitui
    lazygit
    tig
    geany
    geary
    go
    crystal
    clojure
    clojure-lsp
    gcc
    libcap
    evolution
    lazydocker
  st
  elvish
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   i3
   grim
   slurp
   wl-clipboard
   inotify-tools
   wlr-randr
   curl
   which
   xdg-utils
   mako
   helix
   wget
  ];
  services.gnome.gnome-keyring.enable=true;
  programs.gamescope.enable=true;
  programs.gamescope.capSysNice=true;
  hardware.graphics.enable=true;
  hardware.graphics.enable32Bit=true;
  programs.steam={
  	enable = true;
  	remotePlay.openFirewall=true;
  	dedicatedServer.openFirewall=true;
  	localNetworkGameTransfers.openFirewall=true;
	gamescopeSession.enable=true;
  };
  hardware.xone.enable=true;
  programs.appimage.enable=true;
  programs.appimage.binfmt=true;
  services.sysprof.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

# programs.ssh.askPassword = false;
  # Enable the OpenSSH daemon.
  services.openssh={
  	# askPassword = false;
  	enable = true;
	# extraConfig = ''
	#   Match user git
	#     AllowTcpForwarding no
	#     AllowAgentForwarding no
	#     PasswordAuthentication no
	#     PermitTTY no
	#     X11Forwarding no
	# '';
};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
