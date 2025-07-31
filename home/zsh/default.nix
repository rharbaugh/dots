{
	pkgs,
	config,
	...
}: {
	home.file.".zshrc" = {
		source = ../../dotfiles/.zshrc;
		recursive = false;
	};
	home.file.".zshenv" = {
		source = ../../dotfiles/.zshenv;
		recursive = false;
	};
}
