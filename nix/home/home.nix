{ config, pkgs, ... }:
let unstable = import <nixos-unstable>{};
in
{
	home.username = "assis";
	home.homeDirectory = "/home/assis/";
	#programs.home-manager.enable = true;
	home.stateVersion="21.05";
	home.packages = [
	#	nodejs-16_x
		pkgs.nox
                pkgs.direnv
                unstable.ncspot
                unstable.vscode
                unstable.corefonts
                pkgs.alacritty
                pkgs.nerdfonts
	];
 	home.sessionVariables = {
		EDITOR = "vim";
	};

	programs.vim = {
		enable = true;
		settings = {
			number = true;
		};
	};
}

