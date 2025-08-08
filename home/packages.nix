{
	pkgs,
	config,
	...
}: {
	home.packages = with pkgs; [
		discord
		yubioath-flutter
		weechat
		gimp
		vlc
		ffmpeg
	];
}
