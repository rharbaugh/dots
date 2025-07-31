{
	pkgs,
	config,
	...
}: {
	home.file.".config/nvim" = {
		source = ../../dotfiles/nvim;
		recursive = true;
	};
}
