{
	pkgs,
	config,
	hostname,
	...
}:
let
	displayConfig = if hostname == "benedict" then "laptop" else "desktop";
in
{
	home.file.".config/hypr/hyprdisplays.conf" = {
		source = ../../dotfiles/hyprdisplays-${displayConfig}.conf;
	};

	home.file.".config/hypr" = {
		source = ../../dotfiles/hypr;
		recursive = true;
	};

	home.file.".config/waybar" = {
		source = ../../dotfiles/waybar;
		recursive = true;
	};

	home.file.".config/wofi" = {
		source = ../../dotfiles/wofi;
		recursive = true;
	};

	home.file.".local/share/icons" = {
		source = ../../dotfiles/icons;
		recursive = true;
	};
	#stuff required to run hyprland
	home.packages = with pkgs; [
	];
}
