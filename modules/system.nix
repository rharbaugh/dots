{
	pkgs,
	lib,
	username,
	...
}: {
	imports = [
		./hypr.nix
	];
	users.users.${username} = {
		isNormalUser = true;
		description = username;
		extraGroups = ["networkmanager" "wheel"];
		shell = pkgs.zsh;
	};

	nix = {
		settings = {
			trusted-users = [username];
			experimental-features = [ "nix-command" "flakes"];
		};
		gc = {
			automatic = lib.mkDefault true;
			dates = lib.mkDefault "weekly";
			options = lib.mkDefault "--delete-older-than 7d";
		};
	};

	nixpkgs.config.allowUnfree = true;

	time.timeZone = "US/Eastern";

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

	security.polkit.enable = true;
	networking.firewall = {
		enable = true;
		checkReversePath = false;
		allowedUDPPorts = [ 51820 ];
	};

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
		settings = {
			General = {
				Experimental = true;
			};
		};
	};

	services = {
		#printing
		printing.enable = true;
		#avahi for printer discovery
		avahi = {
			enable = true;
			nssmdns4 = true;
			openFirewall = true;
		};
		#bluetooth stuff
		blueman.enable = true;
		#yubikey stuff
		pcscd.enable = true;
		#ssh
		openssh = {
			enable = true;
			settings = {
				PermitRootLogin = "no";
				PasswordAuthentication = true;
			};
			openFirewall = true;
		};
		#flatpak
		flatpak.enable = true;

		#for laptops, mostly
		power-profiles-daemon = {
			enable = true;
		};

		#location service
		geoclue2.enable = true;

		#sound
		pulseaudio.enable = false;
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;
		};
	};

	programs = {
		dconf.enable = true;
		zsh.enable = true;
		firefox = {
			enable = true;
		};
		steam = {
			enable = true;
			localNetworkGameTransfers.openFirewall = true;
		};
	};

	fonts = {
		packages = with pkgs; [
			material-design-icons
			font-awesome

			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji

			nerd-fonts.hack
			nerd-fonts.symbols-only
		];

		enableDefaultPackages = true;

		#enableDefaultPackages = false;
		#    fontconfig.defaultFonts = {
		#      serif = ["Noto Serif" "Noto Color Emoji"];
		#      sansSerif = ["Noto Sans" "Noto Color Emoji"];
		#      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
		#      emoji = ["Noto Color Emoji"];
		#    };
	};

	environment.systemPackages = with pkgs; [
		vim
		wget
		curl
		git
		lm_sensors
		neofetch
		nnn
		ranger
		neovim
		keychain
		tree
		unzip
		gcc
		rustup
		go
		btop
		networkmanagerapplet
	];
}
