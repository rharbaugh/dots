{
	pkgs,
	config,
	...
}: {
	home.packages = with pkgs; [
		vmware-horizon-client
	];
}
