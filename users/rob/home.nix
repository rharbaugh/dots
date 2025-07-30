{pkgs, ...}: {
	imports = [
		../../home/core.nix
		../../home/hypr
	];
	
	programs.git = {
		userName = "Rob Harbaugh";
		userEmail = "rob@rharbaugh.com";
	};
}
