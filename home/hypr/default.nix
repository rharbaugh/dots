{
	pkgs,
	config,
	...
}: {
	home.file.".config/hypr" = {
		source = ../../dotfiles/hypr;
		recursive = true;
	};
}
