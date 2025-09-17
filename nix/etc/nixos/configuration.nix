# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, callPackage, ... }:

{
	#  inputs = {
	#    nixpkgs = {
	#      url = "github:nixos/nixpkgs/nixos-unstable";
	#    };
	#    hardware = {
	#      url = "github:nixos/nixos-hardware";
	#    };
	#    home-manager = {
	#      url = "github:nix-community/home-manager";
	#      inputs = {
	#        nixpkgs = {
	#   follows = "nixpkgs";
	# };
	#      };
	#    };
	#  };
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
  boot = {
    loader = {
      efi = {
      	# efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  systemd = {
    services = {
      flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
	path = [ pkgs.flatpak ];
	script = ''
	  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	'';
      };
    };
  };
  # programs.steam.extraPackages = [pkgs.jdk];
  # programs.steam.gamescopeSession.enable = true;


  # Use latest kernel.
  networking = {
    hostName = "nixos";
   networkmanager = {
      enable = true;
    };
    # wireless = {
    #   enable = true;
    # };
  };


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  # Set your time zone.
  time = {
    timeZone = "America/Los_Angeles";
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };
  environment = {
    # loginShellInit = ''
    #   [ -d "$HOME/.nix-profile" ] || /nix/var/nix/profiles/per-user/$USER/home-manager/activate &> /dev/null
    # '';
	  systemPackages = with pkgs; [
	  flatpak-builder
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
		# factorio-experimental
		# factorio-space-age
		# factorio-space-age-experimental
		# factorio-utils
		# factoriolab
	    fishPlugins.done
	    fishPlugins.fzf-fish
	    binutils
	    gcc
	    glib
	    glibmm
	    glew
	    glfw
	    llama-cpp
	    lmstudio
	    light
	    swayidle
	    diffutils
	    diff-so-fancy
	    fzy
	    ripgrep
	    google-cloud-sdk
	    playerctl
	    bspwm
	    ranger
	    lf
	    gparted
	    zoom-us
	    libreoffice
	    dconf2nix
	    fd
	    flatpak
	    
	    kitty
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
	    fuzzel
	    ulauncher
	    delta

	    gimp
	    spotify
	    alacritty
	    firefox-devedition
	    # nix-prefetch-github
	    pavucontrol
	    fishPlugins.forgit
	    fishPlugins.hydro
	    fzf
	    skim
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
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      # only needed for Sway
      XDG_CURRENT_DESKTOP = "sway"; 
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      
    };
  };
  # programs.zsh.enable = true;
  # services.desktopManager.plasma6.enable = true;
  # programs.dbus.enable = true;
  xdg = {
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
      wlr = {
        enable = true;
      };
    };
  };

  # programs.nushell.enable = true;
  # services.server.displayManager.sddm.wayland.enable = true;


  users = {
   # userDefaultShell = pkgs.fish;
    users = {
      clp = {

	    isNormalUser = true;
	    description = "Chris";
	    extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
    packages = with pkgs; [
    kdePackages.kate
    # kdePackages.kile
    # kdePackages.krita
    kdePackages.discover
    kdePackages.kdevelop
    vlc
    gdevelop
    gaphor
    libadwaita
    # libc
    libffi
    imgui
    gnome-connections
    ccache
    sccache
    gamescope
    gcc
    brave
    glibc
    clang
    cmake
    ninja
    neovide
    insomnia
    godot
    kanshi
    dwarf-fortress-full
    mindustry
    minikube
    tabby-agent
    mindustry-wayland
    swayidle
#   cohesion
    postman
    wayland-utils
    bear
    wl-clipboard
    	vim
	cling
	tmuxp
	tokei
	clang-tools
	llvm

	grc
	firecracker
	vscodium
	mg
	neovim
	ov
	zeal
	tilix
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-fast-syntax-highlighting
	ccls

	kakoune
	k9s
	broot
	nnn
	fff
	aerc
	elinks
	w3m
	lynx
	weechat
	toot
	oterm
	irssi
	tuisky
	mqttui
	powershell
	# nmtui
	# diskonaut
	lazyjj
	jj
	jrnl
	termshark
	ncdu
	yt-dlp
	abook
	calcurse
	notion
	navi
	bombadillo
	nwg-launchers
	nwg-panel
	nwg-bar
	nwg-look
	nwg-hello
	yofi
	rofi
	gemini-cli
	codex
	# qwen-code
	wofi
	lavalauncher
	goaccess
	superfile
	duf
	gh-dash
	ly
	trippy
	spotify-player
	viddy
	watchexec
	television
	discordo
	dooit
	# warp-terminal
	pspg
	yambar
	circumflex
	polybar
	gollama
	gemini-cli
	rmpc
	systeroid
	goose
	goose-cli
	geopard
	gitoxide
	gitu
	git-lfs
	# gonzo
	sig
	# lstr
	fm
	sshs
	binsider
	atac
	dblab
	flow
	lunarvim
	serie
	jjui
	# jira-cli
	orbiton
	hwatch
	stu
	# elia
	ad
	tenere
	cargo
	sttr
	bluetuith
	nchat
	# kftray
	turbo
	oxker
	cargo-zigbuild
	cargo-c
	smenu
	jqp
	# oryx
	procs
	rsync
	nmap
	starship
	terminator
	wireshark
	lsd
	eza
	process-compose
	ov
	impala
	# lazyssh
	bat
	# cir
	# rtv
	zx
	khal
	sc-im
	termscp
	zellij
	taskwarrior3
	ly
	taskwarrior-tui
	browsh
	haxor-news
	newsboat
	termusic
	cmus
	s-tui
	visidata
	qutebrowser
	luakit
	vis
	bruno
	httpie
	pods

	amfora
	gnome-builder
	# pulsar
	meld
	dive
	podman
	devhelp
	podman-tui
	docker-compose
	glances
	ctop
	skopeo
	buildah
	podman-compose
	jq
	yq
	fx
	podman-desktop
	gpg-tui
	biblioteca
	ansible
	refine
	marker
	howl
	ollama
	tor-browser
	planify
	alpaca
	endeavour
	emulsion
	helix
	parinfer-rust
	ghex
	lapce
	xplr
	gobang
	oha
	micro
	inspector
	yazi
	thunderbird
	lollypop
	codex
	proton-pass
	ncspot
	foliate
	uv
	wasmer
	wasmtime
	wabt
	wasm-tools
	wasmedge
	mise
	bun
	deno
	zig
	mycli
	opencode
	wezterm
	nim
	seabird
	lagrange
	dive
	pgcli
	fractal
	act
	seahorse
	posting
	himalaya
	just
	gnumake
	gping
	poetry
	meli
	alpine
	mutt
	neomutt
	wtfutil
	obsidian
	gnome-podcasts
	gnome-feeds
	blender
	dotnet-runtime
	spot
	dotnet-sdk
	cozy
	dotnet-repl
	cider
	love
    ];
      };
    };
    
  };
  fonts.fontconfig.defaultFonts.monospace = [ "ZedMono Nerd Font" ];
  services.blueman.enable = true;
	#  security = {
	#  	sudo = {
	# 	extraRules = [
	# 		{
	# 			command = "ALL";
	# 			options = [ "NOPASSWD" ];
	# 		}
	# 	];
	# };
	#  };
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
  # Enable the X11 windowing system.
  # services.desktopManager.plasma-desktop.enable = true;
  # services.desktopManager.sddm.enable = true;
  # services.desktopManager.sddm.wayland.enable = true;
  hardware = {

  	graphics={
		enable=true;
  		enable32Bit=true;
	};
	xone = {
		enable = true;
	};
  	bluetooth = {
		enable = true;
	};
  };
	# sddm = {
	#   enable = true;
	#   settings = {
	#     General = {
	#       DisplayServer = "wayland";
	#     };
	#   };
	#   wayland.enable = true;
	# };
programs = {

  steam={
  	enable = true;
  	remotePlay.openFirewall=true;
  	dedicatedServer.openFirewall=true;
  	localNetworkGameTransfers.openFirewall=true;
	gamescopeSession.enable=true;
  };
  	gamescope = {
		enable=true;
  		capSysNice=true;
	};
  	appimage = {
		enable=true;
  		binfmt=true;
	};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  	mtr.enable = true;
	  gnupg = {
	  	agent = {
		    enable = true;
		    enableSSHSupport = true;
		};
	  };
	firefox.enable = true;
	  git = {
		  enable = true;
		  # userName = "Chris Pecunies";
		  # userEmail = "chris@pecunies.com";~
	  };
	 nix-ld.enable = true; 
	 light.enable = true;
	  i3lock.enable = true;
	  htop.enable  = true;
	  waybar.enable = true;
	  river.enable = true;
	  xwayland.enable = true;
	  wayfire = {
	    enable = true;
	  };
	  hyprland= {
	    xwayland = {
	      enable = true;
	    };
	    enable = true;
	  };
	  labwc.enable = true;

	  sway = {
	    enable = true;
	    wrapperFeatures.gtk = true;
	  };
	  java = {
	    enable = true;
	  };
	  dconf = {
	    enable = true;
	  };
	  xonsh.enable = true;
	  zsh.enable=true;
	  fish.enable=true;
	  
	};
services = {
  flatpak = {
    enable = true;
  };

  factorio = {
  	enable = true;
	openFirewall = true;
};
    # polkit = {
      # enable = true;
    # };
    displayManager = {
      defaultSession = "sway";
      # gdm = {
      #   enable = true;
      # };
      # sddm = {
        # enable = true;
        # wayland = {
          # enable = true;
        # };
      # };
#       
    };
    xserver = {
      displayManager = {
        defaultSession = "sway";
        gdm = {
          enable = true;
        };
        # sddm = {
          # enable = true;
          # wayland = {
            # enable = true;
          # };
        # };
#       
      };
      enable = true;
  	  xkb = {
  	    layout = "us";
  	    variant = "";
  	  };
  	  desktopManager={
  	  	xterm.enable = false;
  	  	gnome.enable = true;
  		  # plasma6.enable = true;
  		};
      windowManager = {
        qtile = {
          enable = true;
        };
        i3 = {
          enable = true;
          extraPackages = with pkgs; [
            dmenu
            i3status
            i3lock
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
	bspwm = {
		enable = true;
		};
        dwm = {
          enable = true;
        };
        openbox = {
          enable = true;
        };
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };

        
      };
      # desktopManager = {
        # plasma6 = {
          # enable = true; };
        # gnome = {
          # enable = true;
          # enableContribAndExtras=true;
        # };
      # };
    };
  };

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
nix = {
  # registry = lib.mapAttrs' (n: v: lib.nameValuePair n { flake = v; }) inputs;
  gc = {
    automatic = true;
    persistent = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
};
  virtualisation= {
  	containers.enable = true;
  	podman = {
    	enable = true;
  	  dockerCompat = false;
  	  defaultNetwork = {
  	    settings = {
  	      dns_enabled = true;
  	    };
  	  };
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

  # Install firefox.

  # Allow unfree packages
  nixpkgs = {
  	config = {
		allowUnfree = true;
	};
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  services.gnome.gnome-keyring.enable=true;
  services.sysprof.enable = true;

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
  system = {
  	autoUpgrade = {
	  enable = true;
	  channel = "https://nixos.org/channels/nixos-22.05";
	};
  	stateVersion = "25.05"; # Did you read the comment?
};

}
