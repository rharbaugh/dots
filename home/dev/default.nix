{
	pkgs,
	config,
	...
}: {
	home.packages = with pkgs; [
		go
		rustup
	];
}
