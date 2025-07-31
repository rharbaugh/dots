{pkgs, ...}: {
	imports = [
		../../home/core.nix
		../../home/hypr
		../../home/ghostty
		../../home/nvim
		../../home/zsh
	];
	
	programs.git = {
		userName = "Rob Harbaugh";
		userEmail = "rob@rharbaugh.com";
	};
}
