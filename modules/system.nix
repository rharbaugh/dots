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
	nix.settings = {
		trusted-users = [username];
		experimental-features = [ "nix-command" "flakes"];
	};
	nix.gc = {
		automatic = lib.mkDefault true;
		dates = lib.mkDefault "weekly";
		options = lib.mkDefault "--delete-older-than 7d";
	};

	nixpkgs.config.allowUnfree = true;

	time.timeZone = "US/Eastern";

	i18n.defaultLocale = "en_US.UTF-8";

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

	services.printing.enable = true;

	fonts = {
		packages = with pkgs; [
			material-design-icons

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

	programs.dconf.enable = true;
	programs.zsh.enable = true;

	networking.firewall.enable = false;

	services.openssh = {
		enable = true;
		settings = {
			PermitRootLogin = "no";
			PasswordAuthentication = true;
		};
		openFirewall = true;
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
	];

	programs.firefox = {
		enable = true;
	};

	services.pulseaudio.enable = false;
	services.power-profiles-daemon = {
		enable = true;
	};

	security.polkit.enable = true;

	services = {
		geoclue2.enable = true;

		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;
			jack.enable = true;
		};

	};
}
