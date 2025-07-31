{pkgs, ...}: {
	#hyprland stuff
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	environment.systemPackages = [
		pkgs.ghostty
	];

	#this yells at electron apps to make them want to use wayland
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
