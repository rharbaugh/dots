{
	pkgs,
	config,
	...
}: {
	home.file.".config/waybar" = {
		source = ../../dotfiles/waybar;
		recursive = true;
	};

	#stuff required to run waybar
	home.packages = with pkgs; [
	];
}
