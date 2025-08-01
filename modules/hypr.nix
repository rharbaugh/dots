{pkgs, ...}: {
	#hyprland stuff
	programs.hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
	};

	services.greetd.enable = true;
	programs.regreet = {
		enable = true;
		theme.name = "gruvbox-dark";
		theme.package = pkgs.gruvbox-dark-gtk;
	};


	environment.systemPackages = [
		pkgs.gruvbox-dark-gtk
		pkgs.gruvbox-dark-icons-gtk
		pkgs.wofi
		pkgs.waybar
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
