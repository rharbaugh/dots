{
	pkgs,
	config,
	...
}: {
	home.file.".config/hypr" = {
		source = ../../dotfiles/waybar;
		recursive = true;
	};

	#stuff required to run waybar
	home.packages = with pkgs; [
	];
}
