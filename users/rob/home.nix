{pkgs, ...}: {
	imports = [
		../../home/core.nix
		../../home/hypr
		../../home/ghostty
		../../home/nvim
	];
	
	programs.git = {
		userName = "Rob Harbaugh";
		userEmail = "rob@rharbaugh.com";
	};
}
