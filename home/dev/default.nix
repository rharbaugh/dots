{
	pkgs,
	config,
	...
}: {
	home.packages = with pkgs; [
		gcc
		go
		rustup
		mosh
		tmux
		lazygit
	];
}
