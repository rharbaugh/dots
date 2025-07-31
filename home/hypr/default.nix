{
	pkgs,
	config,
	...
}: {
	home.file.".config/hypr" = {
		source = ../../dotfiles/hypr;
		recursive = true;
	};

	#stuff required to run hyprland
	home.packages = with pkgs; [
	];
}
