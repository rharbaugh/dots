# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot.enable = true;
  };

  networking.hostName = "benedict"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  system.stateVersion = "25.05"; # Did you read the comment?

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config.permittedInsecurePackages = [
    "libxml2-2.13.8"
  ];
}

