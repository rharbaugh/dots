{
	description = "Rob's NixOS flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs @ {
		self,
		nixpkgs,
		home-manager,
		...
	}: {
		nixosConfigurations = {
			augustine = let
				username = "rob";
				hostname = "augustine";
				specialArgs = {inherit username; inherit hostname;};
			in
				nixpkgs.lib.nixosSystem {
					inherit specialArgs;
					system = "x86_64-linux";

					modules = [
						./hosts/augustine
						./users/${username}/nixos.nix

						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

							home-manager.extraSpecialArgs = inputs // specialArgs;
							home-manager.users.${username} = import ./users/${username}/home.nix;
						}
					];
				};
			benedict = let
				username = "rob";
				hostname = "benedict";
				specialArgs = {inherit username; inherit hostname;};
			in
				nixpkgs.lib.nixosSystem {
					inherit specialArgs;
					system = "x86_64-linux";

					modules = [
						./hosts/benedict
						./users/${username}/nixos.nix

						home-manager.nixosModules.home-manager
						{
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;

							home-manager.extraSpecialArgs = inputs // specialArgs;
							home-manager.users.${username} = import ./users/${username}/home.nix;
						}
					];
				};
			};
			};

}
