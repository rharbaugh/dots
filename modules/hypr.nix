{pkgs, ...}: {
	#hyprland stuff
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	environment.systemPackages = [
		pkgs.ghostty
		pkgs.eza
		pkgs.direnv
		pkgs.bat
		pkgs.hyprshot
		pkgs.hyprlock
		pkgs.hypridle
		pkgs.hyprpaper
		pkgs.hyprsunset
		pkgs.hyprcursor
		pkgs.dunst
		pkgs.xdg-desktop-portal-hyprland
		pkgs.hyprpolkitagent
	];

	#this yells at electron apps to make them want to use wayland
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
