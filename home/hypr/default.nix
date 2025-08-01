{
	pkgs,
	config,
	...
}: {
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
