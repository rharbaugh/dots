{
	pkgs,
	config,
	...
}: {
	home.file.".config/ghostty" = {
		source = ../../dotfiles/ghostty;
		recursive = true;
	};
}
