{pkgs, ...}: {
	imports = [
		../../home/core.nix
	];
	
	programs.git = {
		userName = "Rob Harbaugh";
		userEmail = "rob@rharbaugh.com";
	};
}
