{pkgs, ...}: {
	imports = [
		../../home/core.nix
		../../home/hypr
		../../home/ghostty
		../../home/nvim
		../../home/zsh
		../../home/work
		../../home/dev
	];
	
	programs.git = {
		userName = "Rob Harbaugh";
		userEmail = "rob@rharbaugh.com";
	};
}
