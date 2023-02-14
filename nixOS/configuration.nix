###############################################################################
#░█▀▄░▄▀▀▄░█▀▀▄░█▀▀░░▀░░█▀▀▀░█░▒█░█▀▀▄░█▀▀▄░▀█▀░░▀░░▄▀▀▄░█▀▀▄░░░░█▀▀▄░░▀░░█░█
#░█░░░█░░█░█░▒█░█▀░░░█▀░█░▀▄░█░▒█░█▄▄▀░█▄▄█░░█░░░█▀░█░░█░█░▒█░▄▄░█░▒█░░█▀░▄▀▄
#░▀▀▀░░▀▀░░▀░░▀░▀░░░▀▀▀░▀▀▀▀░░▀▀▀░▀░▀▀░▀░░▀░░▀░░▀▀▀░░▀▀░░▀░░▀░▀▀░▀░░▀░▀▀▀░▀░▀
#	AUTHOR: J. Langedijk
#	DESCRIPTION: NixOS custom config based on the default
###############################################################################
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; 			# Define your hostname.
  #networking.wireless.enable = true;  		# Enables wireless support

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #########################################################################
  # Enable sound with pipewire.
  #########################################################################
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  #########################################################################
  # Enable touchpad support (enabled default in most desktopManager).
  #########################################################################
  services.xserver.libinput.enable = true;

  #########################################################################
  # Define a user account. Don't forget to set a password with ‘passwd’.
  #########################################################################
  users.users.jellel = {
    isNormalUser = true;
    description = "Jelle Langedijk";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  #########################################################################
  # Allow unfree packages
  #########################################################################
  nixpkgs.config.allowUnfree = true;

  #########################################################################
  # List packages installed in system profile.
  #########################################################################
  environment.systemPackages = with pkgs; [
  	vim								# Text Editor
  	wget							# Puller
	librewolf						# Browser
	gnomeExtensions.dash-to-dock 	# Dash-to-Dock Extension
	gnome.gnome-tweaks				# Gnome Shell Tweaks
	github-desktop					# Github Desktop
	octave							# GNU Octave
	openscad						# CAD Software
	gmsh							# Mesher
	htop							# HTOP
	texlive.combined.scheme-full	# LaTeX and co.
	pandoc							# Pandoc
	zotero							# Zotero Reference Manager
	gitFull							# Git
	zathura							# PDF Viewer
	screenfetch						# Fetcher
	nnn								# File Manager
	gcc								# GNU Compiler Collection
	exa								# LS Alternative
	zip unzip						# Archiver
	curl							# Curl
	bat								# Cat Alternative
	mpv								# MPV
	fstl							# STL viewer
	ffmpeg							# FFMPEG
  ];

  #########################################################################
  # Remove undesired GNOME default apps.
  #########################################################################
  environment.gnome.excludePackages = with pkgs; [
	gnome.gnome-music
	gnome.gnome-terminal
	gnome.gedit
	epiphany
	evince
	gnome.gnome-characters
	gnome.totem
	gnome.tali
	gnome.iagno
	gnome.hitori
	gnome.atomix
	gnome.gnome-weather
	gnome.geary
	gnome.gnome-maps
	gnome.gnome-calculator
	gnome.gnome-calendar
  ];



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
